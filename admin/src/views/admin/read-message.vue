<template>
  <div style="width: 98%; margin: 0px auto; margin-top: 10px">
    <el-alert
      v-if="student.length"
      :title="`${studentName}同学：你有${student.length}课成绩不及格，请及时联系老师补考`"
      type="warning"
    >
    </el-alert>
    <el-collapse style="margin-top: 10px">
      <el-collapse-item
        :title="item.title"
        v-if="tableData.length"
        v-for="(item, index) in tableData"
        :key="item.title + index"
      >
        <div class="mes-text">{{ item.text }}</div>
      </el-collapse-item>
      <!-- 不及格提示 -->
      <el-collapse-item
        :title="`关于${item.key}考试不及格`"
        v-if="student.length && isStudent && isWatch == 'true'"
        v-for="(item, index) in student"
        :key="item.key + index"
      >
        <div class="mes-text">
          {{ studentName }}同学：
          <p>你的{{ item.key }}成绩为{{ item.value }}分。请联系老师补考</p>
        </div>
      </el-collapse-item>
    </el-collapse>
  </div>
</template>
<script setup>
import { ref } from "vue";
import api from "@/modules/api";
let tableData = ref("");
let student = ref([]);
let isStudent = ref(localStorage.id == "student");
let studentName = ref(localStorage.student);
let isWatch = ref("");
api(`select * from isshow`).then(res => {
  isWatch.value = res.res[0].watch;
});
if (localStorage.id == "student") {
  api(`select * from achievement where stucode='${localStorage.student}';`).then(res => {
    studentName.value = res.res[0].name;
    tableData.value = res.res;
    let data = res.res[0];
    if (+data.prog_fund < 60) {
      student.value.push({
        key: "程序设计基础",
        value: data.prog_fund,
      });
    }
    if (+data.disc_math < 60) {
      student.value.push({
        key: "离散数学",
        value: data.disc_math,
      });
    }
    if (+data.adv_prog < 60) {
      student.value.push({
        key: "高级程序设计",
        value: data.adv_prog,
      });
    }
    if (+data.data_struct < 60) {
      student.value.push({
        key: "数据结构",
        value: data.data_struct,
      });
    }
    if (+data.comp_princ < 60) {
      student.value.push({
        key: "计算机组成原理",
        value: data.comp_princ,
      });
    }
    if (+data.db_princ < 60) {
      student.value.push({
        key: "数据库原理",
        value: data.db_princ,
      });
    }
  });
}
api(`select * from message`).then(res => {
  tableData.value = res.res;
});
</script>
<style scoped lang="scss">
.mes-box {
  padding: 20px 0px;
  border-bottom: 1px solid black;
}
.mes-title {
  font-weight: 700;
}
</style>
