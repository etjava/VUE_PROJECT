<template>
  <div>
    <div class="login-logo">通讯录</div>
    <form action="" class="login-cont">
      <ul>
        <li>
          <input v-model="userName" type="text" placeholder="请输入用户名：">
        </li>
        <li>
          <input v-model="password" type="password" placeholder="请输入密码：">
        </li>
      </ul>
      <a href="javascript:;" class="submitButton" @click="submit()">登  录</a>
      <p class="errorInfo">{{errorInfo}}</p>
    </form>
    <p class="copyright">
      Copyright © 2012-2022 <a href="#">www.etjava.com</a>
    </p>
  </div>
</template>

<script>
import axios from 'axios'
import {serverUrl} from '@/config/sys.js' // 获取js中的某个方法
export default {
  name: "Login",
  data(){
    return{
      userName:'',
      password:'',
      errorInfo:''
    }
  },
  methods:{
    submit(){
      let url = serverUrl("login");
      console.log(url);

      if(this.userName.trim()==''){
        this.errorInfo="用户名不能为空！";
        return;
      }
      if(this.password.trim()==''){
        this.errorInfo="密码不能为空！";
        return;
      }
      axios.post(url,{"userName":this.userName,"password":this.password})
        .then(response=>{
          if(response.data.code==0){
            console.log(response.data.token);
            window.localStorage.setItem("token",response.data.token);
            // 跳转到主页 无需压栈 使用replace即可
            this.$router.replace("/phoneBook");
          }else{
            this.errorInfo=response.data.msg;
          }
        }).catch(error=>{
        this.errorInfo=error;
      })
    }
  }
}
</script>

<style lang="stylus" scoped>

.login-logo
  width: 3rem;
  height: 3rem;
  background: #10a78e;
  margin: 1rem auto .5rem;
  color: #fff;
  line-height: 3rem;
  font-size: .8rem;
  border-radius: 50%;
  overflow: hidden;
  text-align: center;

.login-cont
  margin: 1rem .8rem;
  line-height: .4rem;
  li
    border-bottom: 1px solid #ebebeb;
    height: 1rem;
    padding: .3rem 0 0;
    position: relative;
    overflow: hidden;
    input
      border: none;
      line-height: .8rem;
      width: 100%;
      outline: 0;
  .submitButton
    background: #10a78e;
    color: #fff;
    border-radius: 1rem;
    height: 1rem;
    line-height: 1rem;
    font-size: .6rem;
    margin-top: 1rem;
    padding: 0;
    text-align: center;
    display: block;
  .errorInfo
    color: red;
    padding-top: .3rem;
.copyright
  position: absolute;
  padding-top: 0;
  padding-left: 1rem;
  font-size: .3rem;

</style>
