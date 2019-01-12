import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueCarousel from 'vue-carousel'
import lineClamp from 'vue-line-clamp';
import VuePlyr from 'vue-plyr'

Vue.use(VuePlyr)
Vue.use(VueCarousel)
Vue.use(lineClamp)


Vue.config.productionTip = false
// define a mixin global
Vue.mixin({
	
  methods: {
    scrolltop(){
			let ref = this
			let scroll = (document.documentElement || document.body.parentNode || document.body).scrollTop;
			this.$store.dispatch('setScoll',  scroll)
			var t = setInterval(()=>{
				let height = ref.$store.state.global.scroll
				window.scrollTo(0,height);
				this.$store.dispatch('setScoll', height-100)
				console.log(height);
				if(height < -100) {
					clearInterval(t)
				}
      },10)
		},
		
  }
})

new Vue({
  router,
	store,
	created() {

	},
  render: h => h(App)
}).$mount('#app')

