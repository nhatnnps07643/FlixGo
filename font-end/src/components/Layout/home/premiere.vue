<template>
   <section class="section section--bg" data-bg="img/section/section.jpg">
		<div class="container">
			<div class="row">
				<!-- section title -->
				<div class="col-12">
					<h2 class="section__title">Phim lẽ mới cập nhật</h2>
				</div>
				<!-- end section title -->
				<!-- card -->
				<div class="col-6 col-sm-4 col-lg-3 col-xl-2" v-for="(item,index) in GetMovieFilmNew" v-bind:key="index">
					<div class="card " @click="scrolltop()">
						<router-link  :to="'movie/'+ item.id">
							<div class="card__cover">
								<img :src="getUrlImage + item.image" alt="">
								<a href="#" class="card__play">
									<i class="icon ion-ios-play"></i>
								</a>
							</div>
						</router-link>
						<div class="card__content">
							<h3 class="card__title"><a href="#">I Dream in Another Language</a></h3>
							<span class="card__category">
								<a href="#">Action</a>
								<a href="#">Triler</a>
							</span>
							<span class="card__rate"><i class="icon ion-ios-star"></i>8.4</span>
						</div>
					</div>
				</div>
				<div class="col-12">
					<a href="#" class="section__btn">Show more</a>
				</div>
				<!-- end section btn -->
			</div>
		</div>
	</section>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
	name: 'premiere',
	computed: {
		...mapGetters(['GetMovieFilmNew','getUrlImage']),
	},
	methods: {
	}
}
</script>

