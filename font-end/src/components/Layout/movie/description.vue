<template>
    <section class="contents">
        <div class="content__head">
            <div class="container">
                <div class="row col-md-12">
                     <div class="title-header-content">
                        <span>Mô tả chi tiết phim</span>
                    </div>
                </div>
            </div>
            <div class="container">
                <div id="description" v-html="getOneMovie.description">
                </div>
            </div>
        </div>
    </section>
</template>
<script>
import { mapGetters } from "vuex"
export default {
    name: 'description',
    computed: {
        ...mapGetters(['getOneMovie']),
    }
}
</script>
<style lang="sass" >
    #description
        color: white
    .title-header-content
        margin: 1rem 0rem
        span
            color: white
            font-size: 1.4rem
    .content__head
        &::before
            display: none
    #description
        img
            width: 100%
    .contents
        margin-top: 3rem
</style>

