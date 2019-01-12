<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <section class='sliderHome detail '>
                    <Carousel 
                    :perPageCustom="[[720,1],[360,1]]"
                    :loop= "false"
                    :autoplay= "true"
                    :speed= "3000"
                    :autoplayTimeout= "5000"
                    :minSwipeDistance= "12">
                        <Slide>
                            <figure class='item '>
                                <!-- <img  class='bg-items' src="/img/gallery/AM-Banner-2.jpg" alt=""> -->
                                <img  class='show-items' src="/img/gallery/AM-Banner-2.jpg" alt="">
                                <figcaption>
                                    <!-- <p>Tên Phim</p>
                                    <small>Mô tả nhỏ</small> -->
                                </figcaption>
                            </figure>
                        </Slide>
                        <Slide>
                            <figure class='item '>
                                <!-- <img  class='bg-items' src="/img/gallery/bumblebee.jpg" alt=""> -->
                                <img   class='show-items' src="/img/gallery/bumblebee.jpg" alt="">
                                <figcaption>
                                    <!-- <p>Tên Phim</p>
                                    <small>Mô tả nhỏ</small> -->
                                </figcaption>
                            </figure>
                        </Slide>
                        <Slide>
                            <figure class='item '>
                                <!-- <img  class='bg-items' src="/img/gallery/Venom-Banner.png" alt=""> -->
                                <img  class='show-items' src="/img/gallery/Venom-Banner.png" alt="">
                                <figcaption>
                                    <!-- <p>Tên Phim</p>
                                    <small>Mô tả nhỏ</small> -->
                                </figcaption>
                            </figure>
                        </Slide>
                    </Carousel>
                </section>
            </div>
        </div>
    </div>
</template>
<script>
import { Carousel, Slide } from 'vue-carousel';
export default {
    name: 'sliderHome',
    data(){
        return {
            image: null
        }
    },
    components: {
        Slide,
        Carousel
    }

}
</script>

<style lang="sass">
    .sliderHome
        padding-top: 70px
        padding-bottom: .5rem
        position: relative
        .item
            position: relative
            padding: 0
            margin-bottom: 0
            img
                width: 100%
            .bg-items
                width: 100%
                hieght: 100%
                position: absolute
                top: 0
                left: 0
                z-index: 0
                -webkit-filter: blur(2px)
                filter: blur(2px)
                opacity: .4
            .show-items
                height: 400px
                object-fit: cover
                position: relative
                z-index: 1
                border-radius: 3px
            figcaption
                text-align: center
                position: absolute
                bottom: 2rem 
                width: 100%
                z-index: 2
                color: white
                padding-bottom: 1rem
                p
                    font:
                        weight: 400
                        size: 2rem
                small
                    font-size: 1.3rem
        .owl-dots
            position: absolute
            bottom: 0
            display: flex
            justify-content: center
            width: 100%
            button 
                background: #fb6d1a3b
                width: 15px 
                height: 15px 
                border-radius: 50%
                margin: .4rem
                border: 1px solid #ff23002b
        .VueCarousel
            position: relative
            .VueCarousel-pagination
                background: #1b1b1d66
                position: absolute
                bottom: 0
                left: 0
                .VueCarousel-dot-container
                    .VueCarousel-dot
                        margin-top: 0 !important

    @media only screen and (max-width: 700px)
        .show-items
            height: 300px
            width: 20%

</style>
