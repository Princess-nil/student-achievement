<template>
  
  <div class="box">
    <b>学生成绩管理系统</b>
    <div class="content">
    <el-input
      placeholder="请输入账号"
      v-model="user"
      clearable
      prefix-icon="el-icon-user"
    >
    </el-input>
    <el-input
      placeholder="请输入密码"
      v-model="password"
      show-password
      clearable
      prefix-icon="el-icon-key"
      style="margin-top: 20px"
    ></el-input>
    <el-select v-model="id" placeholder="请选择">
      <el-option
        v-for="item in options"
        :key="item.value"
        :label="item.label"
        :value="item.value"
      >
      </el-option>
    </el-select>
    <el-button type="primary" icon="el-icon-s-promotion" @click="logn"
      >登录</el-button
    >
  </div>
  </div>
</template>
<script setup>
import { ref, onMounted, onUnmounted } from "vue";
import { useRouter } from "vue-router";
import { ElMessage } from "element-plus";
import lognFun from "@/modules/logn";
let router = useRouter();
onMounted(() => {
  document.body.classList.add("logn");
});
onUnmounted(() => {
  document.body.classList.remove("logn");
});
//账号密码身份
let user = ref("");
let password = ref("");
let id = ref("student");
function logn() {
  if (user.value == "" || password.value == "") {
    ElMessage({
      message: "请将信息填写完整",
      type: "error",
    });
  } else {
    lognFun({
      col: id.value,
      id: user.value,
      password: password.value,
    }).then((res) => {
      if (res.res == false) {
        ElMessage({
          message: "账号或密码错误",
          type: "error",
        });
      } else {
        localStorage.id = res.id; //身份
        localStorage.user = res.user; //账号
        localStorage[res.id] = user.value;
        let go =
          res.id == "admin"
            ? "create-teacher"
            : res.id == "teacher"
            ? "read-student"
            : "student-score";
        router.replace({ path: `/${go}`, query: { user: user.value } });
      }
    });
  }
}
let options = ref([
  {
    label: "学生",
    value: "student",
  },
  {
    label: "教师",
    value: "teacher",
  },
  {
    label: "管理员",
    value: "admin",
  },
]);
</script>
<style scoped lang='scss'>
.box {
  text-align: center;
  width: 400px;
  height: 280px;
  // background-image: linear-gradient(to top, #dbdcd7 0%, #dddcd7 24%, #e2c9cc 30%, #e7627d 46%, #b8235a 59%, #801357 71%, #3d1635 84%, #1c1a27 100%);
  
  margin: 0px auto;
  top: calc((100vh - 310px) / 2);
  position: relative;
  border-radius: 10px;
  padding-top: 30px;
}
.box::before {
  content: ""; /* 伪元素必须有内容，即使是空的 */
  position: absolute; /* 绝对定位，覆盖整个box */
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: white;
  opacity: 0.8;
  z-index: -1; /* 让伪元素在下面，不遮挡输入框 */
}

.content {
  /* 省略了其他样式 */
  position: relative; /* 这一行也很重要，让输入框在上面 */
}
.el-input {
  width: 300px;
  display: block;
  margin: 0px auto;
  opacity: 1;
}

.el-select {
  width: 300px;
  margin-top: 30px;
  margin-left: 0px !important;
}
.el-button {
  width: 300px;
  margin-top: 30px;
}
</style>