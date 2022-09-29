<template>
<div>
  <phone-header></phone-header>
  <phone-search :phoneBooks="phoneBooks"></phone-search>
  <phone-list :letter="letter" :phoneBooks="phoneBooks"></phone-list>
  <phone-book-alphabet @change="handleLetterChange" :phoneBooks="phoneBooks"></phone-book-alphabet>

</div>
</template>

<script>
import axios from 'axios'
import {serverUrl} from '@/config/sys.js'

import PhoneHeader from './components/Header'
import PhoneSearch from './components/Search'
import PhoneList from './components/List'
import PhoneBookAlphabet from './components/Alphabet'

import PubSub from 'pubsub-js'
export default {
  name: "PhoneBook",
  components:{
    PhoneHeader,
    PhoneSearch,
    PhoneList,
    PhoneBookAlphabet
  },
  data(){
    return {
      phoneBooks:{}, // 电话簿列表
      letter:'' // 排序字母 Alphabet传递过来的
    }
  },
  methods:{
    getPhoneBooks(){ // 加载所有电话簿信息
      let url = serverUrl("phoneBook");
      console.log(serverUrl("phoneBook"));
      // 获取token 在localStorage中
      let token = window.localStorage.getItem("token");
      axios.defaults.headers.common['token']=token;// 把token放到请求头中
      axios.get(url+'/all')
        .then(response=>{
          //console.log(response)
          this.phoneBooks = response.data.data;
        }).catch(error=>{
        this.errorInfo=error;
      })
    },
    // 定时刷新token 防止token被拦截后可以继续使用
    refreshToken(){
      let url = serverUrl("phoneBook");
      let token = window.localStorage.getItem("token");
      axios.defaults.headers.common["token"]=token;
      axios.get(url+'/refresh')
        .then(response=>{
          console.log("token刷新返回的 "+response.data.token)
          window.localStorage.setItem("token",response.data.token);
        }).catch(error=>{
        this.errorInfo=error;
      })
    },
    handleLetterChange(letter){
      console.log('传递过来的字母  '+letter)
      this.letter=letter
    }
  },
  mounted() {
    // 间隔10分钟刷新一次token
    setInterval(this.refreshToken,1000*60*10);
    this.getPhoneBooks();// 页面加载完成后执行

    // 刷新电话簿列表
    PubSub.subscribe('refreshPhoneBook',(msg,data)=>{
      console.log('收到消息 refreshPhoneBook')
      this.getPhoneBooks()
    })
  }
}
</script>

<style scoped>

</style>
