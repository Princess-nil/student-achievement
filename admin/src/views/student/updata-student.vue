<template>
  <el-form label-width="80px">
    <el-form-item label="学号">
      <el-input type="text" v-model="id" :disabled="true"></el-input>
    </el-form-item>
    <el-form-item label="学生姓名">
      <el-input
        type="text"
        v-model="name"
        placeholder="填写学生姓名"
        :disabled="isStudent"
      ></el-input>
    </el-form-item>
    <el-form-item label="旧密码">
      <el-input type="text" v-model="old_password" placeholder="旧密码"></el-input>
    </el-form-item>
    <el-form-item label="新密码">
      <el-input type="text" v-model="password" placeholder="新密码"></el-input>
    </el-form-item>

    <el-form-item label="确认密码">
      <el-input type="text" v-model="twi_password" placeholder="确认密码"></el-input>
    </el-form-item>

    <el-form-item label="电话号码">
      <el-input
        type="text"
        v-model="tel"
        placeholder="填写学生电话"
        maxlength="11"
        :disabled="isStudent"
      ></el-input>
    </el-form-item>

    <el-form-item label="性别">
      <el-select v-model="sex" placeholder="请选择"  :disabled="isStudent">
        <el-option
          v-for="item in sexs"
          :key="item.label"
          :label="item.label"
          :value="item.label"
        >
        </el-option>
      </el-select>
    </el-form-item>

    <el-form-item label="班级">
      <el-select v-model="stuClass" placeholder="请选择" :disabled="isStudent">
        <el-option
          v-for="item in setClass"
          :key="item.label"
          :label="item.label"
          :value="item.label"
        >
        </el-option>
      </el-select>
    </el-form-item>
    <el-button type="primary" icon="el-icon-check" @click="create"
      >确认修改</el-button
    >
  </el-form>
</template>
<script setup>
import { ref } from "vue";
import { useRoute } from "vue-router";
import { ElMessage } from "element-plus";
import api from "@/modules/api";
import readUser from "@/modules/common/read-user";
let route = useRoute();
let isStudent = ref(localStorage.id == "student");
let id = ref("");
let name = ref("");
let tel = ref("");
let sex = ref("男");
let password = ref("");

let old_password = ref("");
let twi_password = ref("");

let sexs = ref([
  {
    label: "男",
  },
  {
    label: "女",
  },
]);
let stuClass = ref("计科2001");
let setClass = ref([
  {
    label: "计科2001",
  },
  {
    label: "计科2002",
  },
  {
    label: "计科2003",
  },
  {
    label: "计科2004",
  },
  {
    label: "计科2005",
  },

]);

readUser({
  col: "student",
  id: route.query.id,
}).then((res) => {
  let data = res.res[0];
  name.value = data.name;
  id.value = data.id;
  tel.value = data.tel;
  sex.value = data.sex;
  stuClass.value = data.class;
  old_password.value = data.password;
});

function create() {
  let telTest = /^(?:(?:\+|00)86)?1[3-9]\d{9}$/;
  let nullTest = /^[\s\S]*.*[^\s][\s\S]*$/;
  let isCreate =
    nullTest.test(name.value) &&
    nullTest.test(tel.value) &&
    telTest.test(tel.value);
  if (isCreate && password.value == twi_password.value) {
    api(
      ` UPDATE student SET name='${name.value}',tel='${tel.value}',sex='${sex.value}',class='${stuClass.value}',password='${password.value}' WHERE id='${id.value}';`
    ).then((res) => {
      if (res.res) {
        ElMessage({
          message: `修改成功`,
          type: "success",
        });
      } else {
        ElMessage({
          message: `修改失败`,
          type: "error",
        });
      }
    });
  } else {
    ElMessage.warning({
      message: "请按照正确格式填写全部内容",
      type: "warning",
    });
  }
}
</script>
<style scoped lang='scss'>
.el-form-item {
  width: 400px;
  margin: 0px auto;
  margin-top: 30px;
}
.el-button {
  width: 400px;
  margin: 0px auto;
  margin-top: 30px;
  display: block;
}
.el-select {
  margin-top: 0px !important;
  margin-left: 0px !important;
}
</style>