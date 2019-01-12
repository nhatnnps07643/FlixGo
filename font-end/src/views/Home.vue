<template>
  <div class="content">
    <slider></slider>
    <div class="border-titles"></div>
    <season></season>
    <items></items>
    <premiere></premiere>
    <partners></partners>
  </div>
</template>

<script>
// @ is an alias to /src
import slider from '@/components/Layout/home/slider.vue'
import season from '@/components/Layout/home/season.vue'
import items from '@/components/Layout/home/items.vue'
import premiere from '@/components/Layout/home/premiere.vue'
import partners from '@/components/Layout/home/partners.vue'

export default {
  name: 'Home',
  components: {
    season, items, premiere,partners,slider
  },
}
</script>

<style lang='sass'>
</style>
