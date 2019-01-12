<template>
  <div id="app">
    <Loading v-if="getStatusLoading"></Loading>
    <div v-else>
      <Header></Header>
      <router-view/>
      <Footer></Footer>
    </div>
  </div>
</template>

<script>
import Header from "@/components/share/Header.vue";
import Footer from "@/components/share/Footer.vue";
import Loading from "@/components/share/Loading.vue";
import { mapGetters } from "vuex";
export default {
  name: "App",
  components: {
    Header,
    Footer,
    Loading
  },
  methods: {
    scrolltop() {
      window.scrollTo(0, 0);
    }
  },
  computed: {
    ...mapGetters(["getStatusLoading"])
  },
  action: {
  },
  created() {
    var ref = this
    this.$store.dispatch('getMovie')
    .then(function(){
      ref.$store.dispatch('setLoading',false);
    })
    this.$store.dispatch('createCatalog')
    this.$store.dispatch('getCountry')
  },
};
</script>
<style lang="sass">
  .content__head
    &:before
      background-image: linear-gradient(90deg, #cacaca 0%, #ffffff 100%) !important
  #videobottom
    position: fixed
    bottom: 0
    right: 0
    z-index: 1000
  .border-titles
    position: relative
    &::before
      content: ''
      width: 100%
      height: 4px
      background: #403f41
      position: absolute
      left: 0
      top: 0
  .data-bg
    background-size: contain
</style>

