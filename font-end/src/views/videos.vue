<template>
   <div id="videos">
        <transition >
            <vue-plyr >
                <video class='videoPlayer' poster="poster.png" src="video.mp4">
                    <source :src="getURL.fhd" type="video/mp4" size="576">
                </video>
            </vue-plyr>
       </transition>
    </div>
</template>
<script>

import { mapGetters } from "vuex";
export default {
    computed:{  
        ...mapGetters(['getURL']),
    },
    created() {
        console.log('get URL');
    }
}
</script>
<style lang="sass" scoped>
    .plyr__poster
        border: 5px solid 
</style>
