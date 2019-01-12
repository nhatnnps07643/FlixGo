<template>
    <div class="trailer">
        <iframe 
            width="100%" 
            height="100%" 
            :src="getOneMovie.trailer" 
            frameborder="0" 
            allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
            allowfullscreen>
        </iframe>
    </div>
</template>
<script>
import { mapGetters } from "vuex"
export default {
    name: "trailer",
    data(){
        return{
        }
    },
    computed: {
        ...mapGetters(['getOneMovie'])
    }
}
</script>
<style lang="sass" scoped>
    .trailer
        height: 100%
        iframe
            border: 5px solid #4e4d4d96
            min-height: 300px
            border-radius: 3px
</style>

