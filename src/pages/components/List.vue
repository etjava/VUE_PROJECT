<template>
  <div class="list" ref="wrapper">
    <div>
      <div class="phoneBook"
           v-for="(item,key) of phoneBooks"
           :key="key" :ref="key">
        <div class="title">{{key}}</div>
        <router-link class="item"
                     tag="div"
                     :to="`/detail/${innerItem.id}`"
             v-for="innerItem of item"
             :key="innerItem.id">
          <img :src="getImageUrl(innerItem.image)" >
          <div class="content border-bottom">{{innerItem.name}}</div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import {serverUrl} from "../../config/sys";
import Bscroll from 'better-scroll'

export default {
  name: "List",
  props:{
    phoneBooks:Object,
    letter:String // 接收父组件(PhoneBook)通过绑定属性传递过来的字母
  },
  methods:{
    getImageUrl(image){
      return serverUrl('image/'+image); // 自己封装的根请求
    }
  },
  mounted() {
    this.scroll=new Bscroll(this.$refs.wrapper,{click:true});// click:true 可以静止点击页面
  },
  // 通过watch 监测字母的变化实现滚动效果
  watch:{
    letter(){
      if(this.letter){
        const element = this.$refs[this.letter][0]
        this.scroll.scrollToElement(element);// 直接滚动到指定的元素
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
/*@import "~@/assets/styles/varibles.styl"*/

.border-bottom
  &:before
    border-color: #D3D3D3

.list
  overflow: hidden
  position: absolute
  top: 1.58rem
  left: 0
  right: 0
  bottom: 0
  .title
    line-height: .54rem
    background: #eee
    padding-left: .2rem
    color: #666
    font-size: .26rem
  .item
    line-height: .76rem
    margin: .2rem
    img
      float: left
      width: .8rem
      height: .8rem
      border-radius: .5rem /*图片圆角 .2rem*/
    .content
      padding-left: 1rem
      font-size: .4rem
      padding-bottom: .3rem
</style>
