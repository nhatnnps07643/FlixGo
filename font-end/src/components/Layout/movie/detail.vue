<template>
  <section class="section data-bg" >
    <div class="container">
      <div class="row">
        <div class="col-12">
          <h1 class="details__title">{{getOneMovie.movie}}</h1>
        </div>
        <div class="col-12 col-xl-5">
          <div class="card card--details">
            <div class="row show-more">
              <!-- card cover -->
              <div class="col-12 col-sm-4 col-md-6 col-lg-6 col-xl-6">
                <div class="card__cover">
                  <img :src="getUrlImage + getOneMovie.image" alt>
                </div>
                <div class="card-button-view">
                  <button>
                    <router-link :to="'/view'">Xem phim</router-link>
                  </button>
                  <button>
                    <router-link :to="'/view'">Download</router-link>
                  </button>
                </div>
              </div>
              <div class="col-12 col-md-6 ">
                <div class="card__content">
                  <div class="card__wrap">
                    <span class="card__rate">
                      <i class="icon ion-ios-star"></i>
                      {{getOneMovie.evaluate}}
                    </span>
                    <ul class="card__list">
                      <li>{{getOneMovie.resolution}}</li>
                      <li>{{getOneMovie.age}}+</li>
                    </ul>
                  </div>
                  <ul class="card__meta">
                    <li>
                      <span>Thể loại:</span>
                      {{getOneMovie.catalog}}
                    </li>
                    <li>
                      <span>Năm phát hành:</span>
                      {{getOneMovie.release_year}}
                    </li>
                    <li>
                      <span>Thời gian phim:</span>
                      {{getOneMovie.release_year}}
                    </li>
                    <li>
                      <span>Quốc gia:</span>
                      <a href="#">{{getOneMovie.country}}</a>
                    </li>
                  </ul>
                  <div
                    v-line-clamp:20="7"
                    class="card__description card__description--details moreline-detail"
                  >{{getOneMovie.short_description}}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12 col-xl-7">
          <trailer></trailer>
        </div>
      </div>
    </div>
  </section>
</template>
	
<script>
// import videos from '@/components/Layout/movie/videos.vue'
import trailer from "@/components/Layout/movie/trailer.vue";
import { mapGetters } from "vuex";
import { mapState } from "vuex";
export default {
  data() {
    return {
      data: 0
    };
  },
  name: "movieDetail",
  computed: {
    ...mapGetters(["getOneMovie", "getUrlImage"]),
    ...mapState(["onemovie"])
  },
  components: {
    trailer
  },
  mounted(){
    let ListData = document.querySelectorAll('.data-bg')
    ListData.forEach(element => {
      let src = element.getAttribute("data-bg");
      element.style.backgroundImage = "url("+src+")"
    });
  }
};
</script>

<style lang='sass' scoped>
	section
		padding: 2rem 0
	#player
		width: 100%
	.text-white
		color: white
	.card__cover
		box-shadow: 0 5px 25px 0 rgba(0,0,0,0.3)
		img
			height: 100%
			object-fit: cover
	.details__title 
		font-size: 1.5rem
	.show-more
		height: 100%
		.card-button-view
			display: flex
			justify-content: space-between
			button
				background-image: -webkit-linear-gradient(90deg, #ff55a5 0%, #ff5860 100%)
				background-image: -ms-linear-gradient(90deg, #ff55a5 0%, #ff5860 100%)
				background-image: linear-gradient(90deg, #ff55a5 0%, #ff5860 100%)
				margin: .8rem 0rem 0rem 0rem
				padding: .3rem .6rem
				border-radius: 3px 
				a
					color: white
</style>