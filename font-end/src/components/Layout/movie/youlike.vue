<template>
    <section class="contents border-title">
		<div class="row">
			<!-- section title -->
			<div class="col-12">
				<h2 class="section__title section__title--sidebar">Phim bạn có thể thích</h2>
			</div>
			<div class="col-6 col-sm-4 col-lg-6" v-for="(item,index) in GetMovieFilm" v-bind:key="index">
				<div class="card " @click="updateMovie()">
					<div class="card__cover" @click="scrolltop()">
						<img :src="getUrlImage + item.image " :id="item.id" alt="">
						<router-link :to="'/movie/'+ item.id">
							<a href="#" class="card__play">
								<i class="icon ion-ios-play"></i>
							</a>
						</router-link>
					</div>
					<div class="card__content">
						<h3 class="card__title">{{item.movie}}</h3>
						<span class="card__category">
							<a href="#">{{item.catalog}}</a>
							<a href="#">{{item.country}}</a>
						</span>
						<span class="card__rate"><i class="icon ion-ios-star"></i>8.4</span>
					</div>
				</div>
			</div>
		</div>
	</section>
</template>
<script>
import { mapGetters } from 'vuex';

export default {
	name: 'contents',
	data(){
		return {
			comment: "",
			class: ''
		}
	},
	computed: {
		...mapGetters(['GetMovieFilm','getUrlImage']),
		getClass(){
			return this.class
		}
	},
	methods: {
		updateMovie(){
			let id = this.$route.params.id
			this.$store.dispatch('getMovieDetail',id)
		}
	},
}
</script>
<style lang="sass" scpoed>
	.comments__avatar
		height: 40px
		width: 40px
		object-fit: cover
	.notification
		color: white
		margin: 1rem 0 0 0
	.disablebutton
		background: #9a9494b3
		cursor: none
		box-shadow: none
</style>


