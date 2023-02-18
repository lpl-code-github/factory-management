<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()"
             label-width="80px">
      <el-form-item label="工作事务" prop="name">
        <el-input v-model="dataForm.name" placeholder="工作事务"></el-input>
      </el-form-item>
      <el-form-item label="描述信息" prop="description">
        <el-input v-model="dataForm.description" placeholder="描述信息"></el-input>
      </el-form-item>
      <el-form-item label="负责人" prop="responsible">
        <el-select v-model="dataForm.responsible" placeholder="请选择负责人">
          <el-option v-for="s in selectUser"  :key="s.id" :label="s.username" :value="s.username"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="状态">
        <el-select v-model="dataForm.state" placeholder="请选择工作状态">
          <el-option label="已打开" value="已打开"></el-option>
          <el-option label="已完成" value="已完成"></el-option>
          <el-option label="处理中" value="处理中"></el-option>
          <el-option label="已关闭" value="已关闭"></el-option>
        </el-select>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
export default {
  data () {
    return {
      visible: false,
      selectUser: [],
      dataForm: {
        id: 0,
        name: '',
        description: '',
        username: sessionStorage.getItem('username'),
        responsible: '',
        state: ''
      },
      dataRule: {
        name: [
          {required: true, message: '工作事务不能为空', trigger: 'blur'}
        ],
        description: [
          {required: true, message: '描述信息不能为空', trigger: 'blur'}
        ],
        responsible: [
          {required: true, message: '负责人不能为空', trigger: 'blur'}
        ],
        state: [
          {required: true, message: '状态不能为空', trigger: 'blur'}
        ]
      }
    }
  },
  created() {
    this.$http({
      url: this.$http.adornUrl(`/user/no-employee`),
      method: 'get',
      params: this.$http.adornParams()
    }).then(({data}) => {
      this.selectUser = data
    })
  },
  methods: {
    init(id) {
      this.dataForm.id = id || 0
      this.visible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields()
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/server/workflow/info/${this.dataForm.id}`),
            method: 'get',
            params: this.$http.adornParams()
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.name = data.workflow.name
              this.dataForm.description = data.workflow.description
              this.dataForm.username = sessionStorage.getItem('username')
              this.dataForm.responsible = data.workflow.responsible
              this.dataForm.state = data.workflow.state
            }
          })
        }
      })
    },
    // 表单提交
    dataFormSubmit () {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.$http({
            url: this.$http.adornUrl(`/server/workflow/${!this.dataForm.id ? 'save' : 'update'}`),
            method: 'post',
            data: this.$http.adornData({
              'id': this.dataForm.id || undefined,
              'name': this.dataForm.name,
              'description': this.dataForm.description,
              'username': sessionStorage.getItem('username'),
              'responsible': this.dataForm.responsible,
              'state': this.dataForm.state
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
      })
    }
  }
}
</script>
