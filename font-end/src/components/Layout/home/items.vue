<template>
    <section class="content">
		<div class="content__head">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- content title -->
						<h2 class="content__title">Phim Được Đánh Giá Cao</h2>
						<!-- end content title -->
						<!-- content tabs nav -->
						<ul class="nav nav-tabs content__tabs" id="content__tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true">PHIM LẺ</a>
							</li>

							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false">PHIM BỘ</a>
							</li>	
						</ul>
						<div class="content__mobile-tabs" id="content__mobile-tabs">
							<div class="content__mobile-tabs-btn dropdown-toggle" role="navigation" id="mobile-tabs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<input type="button" value="New items">
								<span></span>
							</div>			
						</div>
					</div>
				</div>
			</div>
		</div>
        <div class="container">
			<!-- content tabs -->
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="1-tab">
					<div class="row">
						<div class="col-6 col-sm-12 col-lg-6"  v-for="(item,index) in GetMovieFilm" v-bind:key='index'>
							<div class="card card--list" >
								<div class="row">
									<div class="col-12 col-sm-4">
										<div class="card__cover" >
											<img :src="getUrlImage+item.image" alt="">
											<router-link :to="'/movie/'+ item.id"  >
											<span @click='scrolltop()' class="card__play" >
												<i class="icon ion-ios-play"></i>
											</span>
											</router-link>
										</div>
									</div>
									<div class="col-12 col-sm-8">
										<div class="card__content">
											<h3 class="card__title">{{item.movie}}</h3>
											<span class="card__category">
												<a href="#">{{item.catalog}}</a>
											</span>
											<div class="card__wrap">
												<span class="card__rate"><i class="icon ion-ios-star"></i>{{item.evaluate}}</span>
												<ul class="card__list">
													<li>{{item.resolution}}</li>
													<li>{{item.age}} + </li>
												</ul>
											</div>
											<div class="card__description">
												<p>{{item.short_description}}</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>	
					</div>	
				</div>

				<div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="2-tab">
					<div class="row">
						<!-- card -->
						<div class="col-6 col-sm-4 col-lg-3 col-xl-2"  v-for="(item,index) in GetMovieFilms" v-bind:key='index'>
							<div class="card" >
								<div class="card__cover">
									<img :src="getUrlImage+item.image" alt="">
									<router-link :to="'/movie/'+ item.id" >
									<span @click='scrolltop()' class="card__play">
										<i class="icon ion-ios-play"></i>
									</span>
									</router-link>
								</div>
								<div class="card__content">
									<h3 class="card__title">{{item.movie}}</h3>
									<span class="card__category">
										<a href="#">{{item.catalogy}}</a>
									</span>
									<span class="card__rate"><i class="icon ion-ios-star"></i>{{item.evaluate}}</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end content tabs -->
		</div>
    </section>
</template>
<script>
import {mapGetters} from 'vuex'
export default {
	name: 'Item',
	computed: {
		...mapGetters(['GetMovieFilm','GetMovieFilms','getUrlImage']),
	},
	methods: {
	},
}
</script>

<style lang="sass" scoped>
	.content__title
		color: white !important
		margin: 0
		font-size: 30px
	.card__title
		padding: 10px 0px
	
</style>
