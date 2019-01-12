<template>
    <section class="homes">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h1 class="home__title"><b>Xếp hạng phim</b></h1>
				</div>
				<div class="col-12">
					<carousel 
						:perPageCustom="[[720,6]]" 
						:loop = "true"
						:navigationEnabled = "true"
						:autoplay= "true"
						:speed= "3000"
						:autoplayTimeout= "5000"
						:paginationEnabled = "false  "
						class ="row"
						>
						<slide v-for="(item,index) in GetMovieNew" v-bind:key="index">
							<div class="card card--big " >
								<div class="card__cover">
									<img :src="getUrlImage+item.image" alt="">
									<router-link :to="'/movie/'+ item.id" >
										<span  @click="scrolltop()" class="card__play">
											<i class="icon ion-ios-play"></i>
										</span>
									</router-link>
								</div>
								<div class="card__content">
									<h3 :title="item.movie">{{item.movie}}</h3>
									<span class="card__category">
										<a href="#">{{item.catalog}}</a>
									</span>
								</div>
							</div>
						</slide>
					</carousel>
				</div>
			</div>
		</div>
	</section>
</template>


<script>
import { mapGetters } from 'vuex';
import { Carousel, Slide } from 'vue-carousel';
export default {
	name: 'HomeSectionItem',
	computed: {
		...mapGetters(['GetMovieNew','getUrlImage'])
	},
	components: {
		Carousel,
		Slide
	},
	methods: {
	}
}
</script>
<style lang='sass' scoped >
	.VueCarousel-navigation-prev
		background: red
	.home__carousel .card__title
		font-size: 1rem
	.homes
		// background: whi
		padding: .5rem 0rem 3rem 0rem
		background: #19191b
	.home__title,.content__title
		margin: 1rem 0rem
		text-transform: capitalize
		color: white !important
		b
			font-size: 1.4rem
	.card--big
		margin: 0rem .5rem
		img 
			height: 15rem
			object-fit: cover
	.VueCarousel-navigation
		button
			background: blue
	.card__content
		h3
			color: white
			white-space: nowrap
			overflow: hidden
			text-overflow: ellipsis
			max-width: 170px
			font-weight: 300
</style>


