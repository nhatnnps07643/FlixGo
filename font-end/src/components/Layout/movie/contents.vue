<template>
    <section class="contents">
		<div class="content__head">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<ul class="nav nav-tabs content__tabs" id="content__tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true">Bình Luận</a>
							</li>

							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false">Đánh giá</a>
							</li>

							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3" aria-selected="false">Hình ảnh</a>
							</li>
						</ul>
						
						<div class="content__mobile-tabs" id="content__mobile-tabs">
							<div class="content__mobile-tabs-btn dropdown-toggle" role="navigation" id="mobile-tabs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<input type="button" value="Comments">
								<span></span>
							</div>

							<div class="content__mobile-tabs-menu dropdown-menu" aria-labelledby="mobile-tabs">
								<ul class="nav nav-tabs" role="tablist">
									<li class="nav-item"><a class="nav-link active" id="1-tab" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true">Comments</a></li>

									<li class="nav-item"><a class="nav-link" id="2-tab" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false">Reviews</a></li>

									<li class="nav-item"><a class="nav-link" id="3-tab" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3" aria-selected="false">Photos</a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-8 col-xl-8">
					<!-- content tabs -->
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="1-tab">
							<div class="row">
								<!-- comments -->
								<div class="col-12">
									<div class="comments">
										<ul class="comments__list">
											<div v-for="(item,index) in getComments" v-bind:key="index">
												<li class="comments__item" >
													<div class="comments__autor">
														<img class="comments__avatar" :src="'http://localhost/rest/page/public/img/'+ item.avatar" alt="">
														<span class="comments__name">{{item.namecustomer}}</span>
														<span class="comments__time">{{item.datecomment}}</span>
													</div>
													<p class="comments__text">{{item.content}}</p>
													<div class="comments__actions">
														<div class="comments__rate">
															<button type="button"><i class="icon ion-md-thumbs-up"></i>{{item.likes}}</button>

															<button type="button">{{item.unlikes}}<i class="icon ion-md-thumbs-down"></i></button>
														</div>
														<button type="button"><i class="icon ion-ios-share-alt"></i>Reply</button>
														<button type="button"><i class="icon ion-ios-quote"></i>Quote</button>
													</div>
												</li>
												<li class="comments__item comments__item--answer" v-if='false'>
													<div class="comments__autor">
														<img class="comments__avatar" src="img/user.png" alt="">
														<span class="comments__name">John Doe</span>
														<span class="comments__time">24.08.2018, 16:41</span>
													</div>
													<p class="comments__text">Nội dung</p>
													<div class="comments__actions">
														<div class="comments__rate">
															<button type="button"><i class="icon ion-md-thumbs-up"></i>8</button>

															<button type="button">3<i class="icon ion-md-thumbs-down"></i></button>
														</div>

														<button type="button"><i class="icon ion-ios-share-alt"></i>Reply</button>
														<button type="button"><i class="icon ion-ios-quote"></i>Quote</button>
													</div>
												</li>
											</div>
										</ul>

										<form action="#" class="form">
											<textarea id="text" name="text" class="form__textarea" placeholder="Add comment" v-model="comment"></textarea>
											<p class='notification' v-if="!getStatusUser">Bạn phải đăng nhập mới được bình luận</p>
											<button type="button" :class="'form__btn ' + getClass " @click="addComment()">Send</button>
										</form>
									</div>
								</div>
								<!-- end comments -->
							</div>
						</div>

						<div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="2-tab">
							<div class="row">
								<!-- reviews -->
								<div class="col-12">
									<div class="reviews">
										<ul class="reviews__list">
											<li class="reviews__item" >
												<div class="reviews__autor">
													<img class="reviews__avatar" src="/img/user.png" alt="">
													<span class="reviews__name">Best Marvel movie in my opinion</span>
													<span class="reviews__time">24.08.2018, 17:53 by John Doe</span>

													<span class="reviews__rating"><i class="icon ion-ios-star"></i>8.4</span>
												</div>
												<p class="reviews__text">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
											</li>

											<li class="reviews__item">
												<div class="reviews__autor">
													<img class="reviews__avatar" src="/img/user.png" alt="">
													<span class="reviews__name">Best Marvel movie in my opinion</span>
													<span class="reviews__time">24.08.2018, 17:53 by John Doe</span>

													<span class="reviews__rating"><i class="icon ion-ios-star"></i>9.0</span>
												</div>
												<p class="reviews__text">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
											</li>

											<li class="reviews__item">
												<div class="reviews__autor">
													<img class="reviews__avatar" src="/img/user.png" alt="">
													<span class="reviews__name">Best Marvel movie in my opinion</span>
													<span class="reviews__time">24.08.2018, 17:53 by John Doe</span>

													<span class="reviews__rating"><i class="icon ion-ios-star"></i>7.5</span>
												</div>
												<p class="reviews__text">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
											</li>
										</ul>

										<form action="#" class="form">
											<input type="text" class="form__input" placeholder="Title">
											<textarea class="form__textarea" placeholder="Review"></textarea>
											<div class="form__slider">
												<div class="form__slider-rating" id="slider__rating"></div>
												<div class="form__slider-value" id="form__slider-value"></div>
											</div>
											<button type="button" class="form__btn">Send</button>
										</form>
									</div>
								</div>
								<!-- end reviews -->
							</div>
						</div>

						<div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="3-tab">
							<!-- project gallery -->
							<div class="gallery" itemscope>
								<div class="row">
									<!-- gallery item -->
									<figure class="col-12 col-sm-6 col-xl-4" itemprop="associatedMedia" itemscope>
										<a href="/img/gallery/project-1.jpg" itemprop="contentUrl" data-size="1920x1280">
											<img src="/img/gallery/project-1.jpg" itemprop="thumbnail" alt="Image description" />
										</a>
										<figcaption itemprop="caption description">Some image caption 1</figcaption>
									</figure>
									<!-- end gallery item -->

									<!-- gallery item -->
									<figure class="col-12 col-sm-6 col-xl-4" itemprop="associatedMedia" itemscope>
										<a href="/img/gallery/project-2.jpg" itemprop="contentUrl" data-size="1920x1280">
											<img src="/img/gallery/project-2.jpg" itemprop="thumbnail" alt="Image description" />
										</a>
										<figcaption itemprop="caption description">Some image caption 2</figcaption>
									</figure>
									<!-- end gallery item -->

									<!-- gallery item -->
									<figure class="col-12 col-sm-6 col-xl-4" itemprop="associatedMedia" itemscope>
										<a href="/img/gallery/project-3.jpg" itemprop="contentUrl" data-size="1920x1280">
											<img src="/img/gallery/project-3.jpg" itemprop="thumbnail" alt="Image description" />
										</a>
										<figcaption itemprop="caption description">Some image caption 3</figcaption>
									</figure>
									<!-- end gallery item -->

									<!-- gallery item -->
									<figure class="col-12 col-sm-6 col-xl-4" itemprop="associatedMedia" itemscope>
										<a href="/img/gallery/project-4.jpg" itemprop="contentUrl" data-size="1920x1280">
											<img src="/img/gallery/project-4.jpg" itemprop="thumbnail" alt="Image description" />
										</a>
										<figcaption itemprop="caption description">Some image caption 4</figcaption>
									</figure>
									<!-- end gallery item -->

									<!-- gallery item -->
									<figure class="col-12 col-sm-6 col-xl-4" itemprop="associatedMedia" itemscope>
										<a href="/img/gallery/project-5.jpg" itemprop="contentUrl" data-size="1920x1280">
											<img src="/img/gallery/project-5.jpg" itemprop="thumbnail" alt="Image description" />
										</a>
										<figcaption itemprop="caption description">Some image caption 5</figcaption>
									</figure>
									<!-- end gallery item -->

									<!-- gallery item -->
									<figure class="col-12 col-sm-6 col-xl-4" itemprop="associatedMedia" itemscope>
										<a href="/img/gallery/project-6.jpg" itemprop="contentUrl" data-size="1920x1280">
											<img src="/img/gallery/project-6.jpg" itemprop="thumbnail" alt="Image description" />
										</a>
										<figcaption itemprop="caption description">Some image caption 6</figcaption>
									</figure>
									<!-- end gallery item -->
								</div>
							</div>
							<!-- end project gallery -->
						</div>
					</div>>
				</div>
				<div class="col-12 col-lg-4 col-xl-4">
					<div class="row">
						<!-- section title -->
						<div class="col-12">
							<h2 class="section__title section__title--sidebar">Phim bạn có thể thích</h2>
						</div>
						<div class="col-6 col-sm-4 col-lg-6" v-for="(item,index) in GetMovieFilm" v-bind:key="index">
							<div class="card " @click="updateMovie()">
								<div class="card__cover" @click="scrolltop()">
									<img :src="'http://localhost/rest/page/public/img/' + item.image " :id="item.id" alt="">
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
				</div>
			</div>
		</div>
	</section>
</template>
<script>
import { mapGetters } from 'vuex';
import axios from 'axios'
export default {
	name: 'contents',
	data(){
		return {
			comment: "",
			class: ''
		}
	},
	mutations: {},
	computed: {
		...mapGetters(['GetMovieFilm','getComments','getStatusUser']),
		getClass(){
			return this.class
		}
	},
	methods: {
		updateMovie(){
			let id = this.$route.params.id
			this.$store.dispatch('getMovieDetail',id)
			this.$store.dispatch('getComments',id)
		},
		addComment(){
			var comment = new FormData()
			comment.append('id_movie',this.$route.params.id);
			comment.append('content',this.comment);
			comment.append('id_customer',this.$store.state.user.id);
			axios({
				method: "POST",
				url: "http://localhost/rest/API/comment.php/insert",
				data: comment
			})
			.then(response => {
				if(response.data == true){
					this.comment = '';
					this.$store.dispatch('getComments', this.$route.params.id)
				}
			})
		}
			
	},
	actions: {},
	created(){
		if(this.$store.state.checkuser == false){
			this.class='disablebutton'
		}
	}
}
</script>
<style lang="sass" scpoed>
	.content__head
		padding: 1rem 0rem 1rem 0
		z-index: 100
		&::before
			background: #615050
			box-shadow: none 

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


