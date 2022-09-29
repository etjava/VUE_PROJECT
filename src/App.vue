<template>
  <div id="app">
    <!-- keep alive 将数据添加到缓存中 不用每次都请求后台获取
    exclude="Detail" 表示不缓存Detail组件的数据
    -->
    <keep-alive exclude="Detail">
      <router-view/>
    </keep-alive>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>

</style>
