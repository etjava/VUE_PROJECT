<template>
  <ul class="list">
    <li class="item" @click="handleLetterClick"
        @touchstart="handleTouchStart"
        @touchmove="handleTouchMove"
        @touchend="handleTouchEnd"

        v-for="(item,key) of letters" :key="item" :ref="item">{{item}}</li>
  </ul>
</template>

<script>
export default {
  name: "Alphabet",
  props:{
    phoneBooks:Object
  },
  data(){
    return{
      touchStatus:false,
      startY:0,
      timer:null // 优化move 节流
    }
  },
  computed:{ // 计算属性
    letters(){
      const letters = [];
      for (let i in this.phoneBooks){
        letters.push(i);// 右侧拼音
      }
      return letters;
    }
  },
  methods:{
    // 点击字母滚动到对应位置
    handleLetterClick(e){
      console.log(e.target.innerText) // 获取当前点击的文本 - 字母
      //
      this.$emit("change",e.target.innerText)
    },
    //
    handleTouchStart(){
      this.touchStatus=true
      console.log("开始滑动")
    },
    handleTouchMove(e){
      console.log("move")
      if(this.timer){
        clearTimeout(this.timer)
      }
      this.timer=setTimeout(()=>{
        if(this.touchStatus){
          const touchY=e.touches[0].clientY-79
          const index=Math.floor((touchY-this.startY)/20)
          if(index>=0 && index<this.letters.length){
            this.$emit("change",this.letters[index])
          }
        }
      },20)
    },
    //
    handleTouchEnd(){
      this.touchStatus=false
      console.log("结束滑动")
    }
  },
  updated() { // 文档加载完毕 数据更新后计算
    this.startY = this.$refs['A'][0].offsetTop; // 字母A到顶部的距离
  }
}
</script>

<style lang="stylus" scoped>
.list
  display : flex
  flex-direction : column
  justify-content : center
  position :absolute
  top:1.58rem
  right : 0
  bottom : 0
  width : .4rem
  .item
    line-height : .4rem
    text-align : center
</style>
