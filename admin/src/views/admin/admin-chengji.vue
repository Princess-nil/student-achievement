<template>
  <el-table :data="tableData" style="width: 100%">
    <el-table-column prop="name" label="学生姓名" width="180">
    </el-table-column>
    <el-table-column prop="stucode" label="学号" width="180"> </el-table-column>
    <el-table-column prop="prog_fund" label="程序设计基础"> </el-table-column>
    <el-table-column prop="disc_math" label="离散数学"> </el-table-column>
    <el-table-column prop="adv_prog" label="高级程序设计"> </el-table-column>
    <el-table-column prop="data_struct" label="数据结构"> </el-table-column>
    <el-table-column prop="comp_princ" label="计算机组成原理"> </el-table-column>
    <el-table-column prop="db_princ" label="数据库原理"> </el-table-column>
    <el-table-column label="删除">
      <template v-slot="scope">
        <el-button type="danger" icon="el-icon-delete" circle
          @click="remove(scope.row.stucode, scope.$index)"></el-button>
      </template>
    </el-table-column>
  </el-table>
</template>
<script setup>
import { ref } from "vue";
import api from "@/modules/api";
import { ElMessage } from "element-plus";


let tableData = ref([]);
api(`select * from achievement`).then((res) => {
  tableData.value = res.res;
});

function remove(id, index) {
  api(`DELETE FROM achievement WHERE stucode="${id}";`).then((res) => {
    if (res.res.affectedRows) {
      tableData.value.splice(index, 1)
    } else {
      ElMessage.error('删除失败')
    }
  });
}

</script>
<style scoped lang='scss'></style>