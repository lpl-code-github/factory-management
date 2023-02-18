<template>
  <div class="mod-demo-echarts">
    <h1 v-if="!isAdmin">欢迎来到工厂内部系统</h1>
    <div v-else>
      <el-alert
        title="当月考勤情况"
        type="warning"
        :closable="false">
      </el-alert>

      <el-row :gutter="20">
        <el-col :span="24">
          <el-card>
            <div id="J_chartLineBox" class="chart-box"></div>
          </el-card>
        </el-col>
      </el-row>
    </div>

  </div>
</template>

<script>
import echarts from 'echarts'

export default {
  data () {
    return {
      isAdmin: sessionStorage.getItem('username') === 'admin',
      chartLine: null,
      dateList: [],
      requestParam: [],
      chuqing: [],
      queqing: []
    }
  },
  async mounted () {
    if (this.isAdmin) {
      this.getDate()
      await this.getData()
      this.initChartLine()
    }
  },
  activated () {
    // 由于给echart添加了resize事件, 在组件激活时需要重新resize绘画一次, 否则出现空白bug
    if (this.isAdmin) {
      if (this.chartLine) {
        this.chartLine.resize()
      }
    }
  },
  methods: {
    async getData () {
      this.getDate()
      await this.$http({
        url: this.$http.adornUrl('/charts/chuqing'),
        method: 'post',
        data: this.requestParam
      }).then(({data}) => {
        this.chuqing = data.chuqing
        this.queqing = data.queqing
        console.log(data)
      })
    },

    getDate () {
      let a = new Date()
      let days = new Date(a.getFullYear(), a.getMonth() + 1, 0).getDate()
      var list1 = []
      var list2 = []
      for (let i = 1; i <= days; i++) {
        a.setDate(i) // 设置月份的日期
        let d = a.getDay() // 获取星期几。 返回0 到 6星期日为 0、星期六为 6。
        if (d > 0 && d < 6) {
          if (a > new Date()) {
            break
          }

          list1.push(a.toLocaleDateString('sv-SE').slice(5))
          list2.push(a.toLocaleDateString('sv-SE'))
        }
      }
      this.requestParam = list2
      this.dateList = list1
    },

    // 折线图
    initChartLine () {
      var option = {
        title: {
          text: 'World Population'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        legend: {},
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'value',
          boundaryGap: [0, 0.01]
        },
        yAxis: {
          type: 'category',
          data: this.dateList
        },
        series: [
          {
            name: '出勤',
            type: 'bar',
            data: this.chuqing
          },
          {
            name: '缺勤',
            type: 'bar',
            data: this.queqing
          }
        ]
      }
      this.chartLine = echarts.init(document.getElementById('J_chartLineBox'))
      this.chartLine.setOption(option)
      window.addEventListener('resize', () => {
        this.chartLine.resize()
      })
    }
  }
}
</script>

<style lang="scss">
.mod-demo-echarts {
  > .el-alert {
    margin-bottom: 10px;
  }

  > .el-row {
    margin-top: -10px;
    margin-bottom: -10px;

    .el-col {
      padding-top: 10px;
      padding-bottom: 10px;
    }
  }

  .chart-box {
    min-height: 400px;
  }
}
</style>
