<template>
  <section class="trailermovie border-title">
    <app-Loading v-if='getStatusLoading' />
    <div v-show='!getStatusLoading'>
      <app-Detail/>
      <div class="border-titles"></div>
      <div class="container">
        <div class="row">
          <div class="col-md-8">
            <description/>
          </div>
          <div class="col-md-4">
            <app-Youlike/>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import AppDetail from "@/components/Layout/movie/detail.vue";
import AppYoulike from "@/components/Layout/movie/youlike.vue";
import description from "@/components/Layout/movie/description.vue";
import AppLoading from "@/components/share/Loading.vue";
import { mapGetters } from 'vuex';
export default {
  name: "Movie",
  components: {
    AppDetail,
    description,
    AppYoulike,
    AppLoading
  },
  computed: {
    ...mapGetters(['getStatusLoading'])
  },
  mounted(){
    let id = this.$route.params.id;
    this.$store.dispatch("getComments", id);
    this.$store.dispatch("getMovieDetail", id);

  },
  created(){ 
   
  }
};
</script>
