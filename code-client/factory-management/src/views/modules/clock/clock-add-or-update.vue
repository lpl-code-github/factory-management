<template>
  <el-dialog
    :title="!dataForm.id ? '打卡' : '打卡'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()"
             label-width="80px">
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>
<script>
export default {
  data() {
    return {
      visible: false,
      dataForm: {
        id: 0,
        userId: '',
        createAt: ''
      },
      dataRule: {
        userId: [
          {required: true, message: '用户id不能为空', trigger: 'blur'}
        ],
        createAt: [
          {required: true, message: '考勤时间不能为空', trigger: 'blur'}
        ]
      }
    }
  },
  methods: {
    init(id) {
      this.dataForm.id = id || 0
      this.visible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields()
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/server/clock/info/${this.dataForm.id}`),
            method: 'get',
            params: this.$http.adornParams()
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.userId = data.clock.userId
              this.dataForm.createAt = data.clock.createAt
            }
          })
        }
      })
    },
    // 表单提交
    dataFormSubmit () {
      var userId = sessionStorage.getItem('userId')
      var date = new Date()
      var hours = date.getHours()
      console.log(hours)
      if (hours >= 9) {
        this.$message.warning('不在正确的打卡时间')
        return
      }
      this.$http({
        url: this.$http.adornUrl(`/server/clock/${!this.dataForm.id ? 'save' : 'update'}`),
        method: 'post',
        data: this.$http.adornData({
          'id': this.dataForm.id || undefined,
          'userId': userId,
          'createAt': this.getNowFormatDate()
        })
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.$message({
            message: '操作成功',
            type: 'success',
            duration: 1500,
            onClose: () => {
              this.visible = false
              this.$emit('refreshDataList')
            }
          })
        } else {
          this.$message.error(data.msg)
        }
      })
    }

  }
}
</script>
