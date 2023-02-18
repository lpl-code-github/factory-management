<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>

        <el-button style="background-color: #00a0e9;border: #00a0e9" type="primary" @click="addOrUpdateHandle()">上班打卡</el-button>
        <el-button type="danger" @click="xiabanHandle()">下班打卡</el-button>
        <!--        <el-button  type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>-->
      </el-form-item>
    </el-form>
    <p>只显示当月考勤记录</p>
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      @selection-change="selectionChangeHandle"
      style="width: 100%;">
      <el-table-column
        type="selection"
        header-align="center"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        prop="date"
        header-align="center"
        align="center"
        label="日期">
      </el-table-column>
      <el-table-column

        header-align="center"
        align="center"
        label="上班考勤时间">
        <template slot-scope="scope">
          <span v-if="scope.row.createAt =='' || scope.row.createAt ==null ">缺勤</span>
          <span v-else>{{ scope.row.createAt }}</span>
        </template>
      </el-table-column>
      <el-table-column
        header-align="center"
        align="center"
        label="下班考勤时间">
        <template slot-scope="scope">
          <span v-if="scope.row.updateAt =='' || scope.row.updateAt ==null">缺勤</span>
          <span v-else>{{ scope.row.updateAt }}</span>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageIndex"
      :page-sizes="[10, 20, 50, 100]"
      :page-size="pageSize"
      :total="totalPage"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
    <!-- 弹窗, 新增 / 修改 -->
  </div>
</template>

<script>
import AddOrUpdate from './clock-add-or-update'

export default {
  data() {
    return {
      dataForm: {
        key: ''
      },
      dataList: [],
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      dataListLoading: false,
      dataListSelections: [],
      addOrUpdateVisible: false
    }
  },
  components: {
    AddOrUpdate
  },
  activated() {
    this.getDataList()
  },
  methods: {
    // 获取数据列表
    getDataList() {
      var list = []
      this.dataListLoading = true
      this.$http({
        url: this.$http.adornUrl('/server/clock/list'),
        method: 'get',
        params: this.$http.adornParams({
          'page': this.pageIndex,
          'limit': this.pageSize,
          'user_id': sessionStorage.getItem('userId'),
          'key': this.dataForm.key
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          let a = new Date()
          let days = new Date(a.getFullYear(), a.getMonth() + 1, 0).getDate()
          for (let i = 1; i <= days; i++) {
            a.setDate(i) // 设置月份的日期
            let d = a.getDay() // 获取星期几。 返回0 到 6星期日为 0、星期六为 6。
            if (d > 0 && d < 6) {
              if (a > new Date()) {
                break
              }
              var o = {}
              o['date'] = a.toLocaleDateString('sv-SE')
              var dataList = data.page.list
              o['createAt'] = ''
              o['updateAt'] = ''
              dataList.forEach(d => {
                if (d.createAt !== null) {
                  if (d.createAt.substring(0, 10) == a.toLocaleDateString('sv-SE')) {
                    o['createAt'] = d.createAt

                  }
                }
                if (d.updateAt !== null) {
                  if (d.updateAt.substring(0, 10) == a.toLocaleDateString('sv-SE')) {
                    o['updateAt'] = d.updateAt
                  }
                }
              })
              list.push(o)
            }
          }
          list.reverse()
          this.dataList = list
          console.log(list)
          this.totalPage = data.page.totalCount
        } else {
          this.dataList = []
          this.totalPage = 0
        }
        this.dataListLoading = false
      })
    },
    // 每页数
    sizeChangeHandle(val) {
      this.pageSize = val
      this.pageIndex = 1
      this.getDataList()
    },
    // 当前页
    currentChangeHandle(val) {
      this.pageIndex = val
      this.getDataList()
    },
    // 多选
    selectionChangeHandle(val) {
      this.dataListSelections = val
    },
    // 新增 / 修改
    addOrUpdateHandle () {
      var date = new Date()
      var dayNow = date.getUTCDay()
      if (dayNow === 0 || dayNow === 6) {
        this.$message.warning('非工作日无需打卡')
        return
      }
      var hours = date.getHours()
      console.log(hours)
      if (hours >= 9) {
        this.$message.warning('不在正确的打卡时间')
        return
      }
      this.$http({
        url: this.$http.adornUrl(`/server/clock/shangban`),
        method: 'post',
        data: this.$http.adornData({
          'userId': sessionStorage.getItem('userId'),
          'createAt': this.getNowFormatDate()
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.$message({
            message: '上班打卡成功',
            type: 'success',
            duration: 1500,
            onClose: () => {
              this.visible = false
            }
          })
        } else {
          this.$message.error(data.msg)
        }
      }).finally(() => {
        this.getDataList()
      })
    },
    xiabanHandle() {
      var date = new Date()
      var dayNow = date.getUTCDay()
      if (dayNow === 0 || dayNow === 6) {
        this.$message.warning('非工作日无需打卡')
        return
      }
      var hours = date.getHours()
      console.log(hours)
      if (hours <= 18) {
        this.$message.warning('不在正确的打卡时间')
        return
      }
      this.$http({
        url: this.$http.adornUrl(`/server/clock/xiaban`),
        method: 'post',
        data: this.$http.adornData({
          'userId': sessionStorage.getItem('userId'),
          'updateAt': this.getNowFormatDate()
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.$message({
            message: '上班打卡成功',
            type: 'success',
            duration: 1500,
            onClose: () => {
              this.visible = false
            }
          })
        } else {
          this.$message.error(data.msg)
        }
      }).finally(() => {
        this.getDataList()
      })
    },
    // 删除
    deleteHandle(id) {
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.id
      })
      this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http({
          url: this.$http.adornUrl('/server/clock/delete'),
          method: 'post',
          data: this.$http.adornData(ids, false)
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.getDataList()
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      })
    }
  }
}
</script>
