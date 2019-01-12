<template>
    <div id="video">
        <transition v-show="checkvideos" >
            <vue-plyr >
                <video class='videoPlayer' poster="poster.png" src="video.mp4">
                    <!-- <source :src="getOneMovie.clip_SD" type="video/mp4" size="576"> -->
                    <source src="https://r1---sn-a5meknee.googlevideo.com/videoplayback?id=81208a22038b92ae&itag=22&source=picasa&begin=0&requiressl=yes&pl=21&sc=yes&ei=vV0vXJv2BoeaoQO3oJGYDQ&susc=ph&app=fife&mime=video/mp4&cnr=14&dur=3990.117&lmt=1546602668923183&ip=116.108.239.133&ipbits=8&expire=1546615261&sparams=app,cnr,dur,ei,expire,id,ip,ipbits,itag,lmt,mime,mm,mn,ms,mv,pl,requiressl,sc,source,susc&signature=025FEE79485BCC5FD70B0242E0932E651A114FE1.6B9783AE924CB0BD205CBE2D4EE1B9C114E7B18F&key=cms1&redirect_counter=1&cm2rm=sn-npoek7l&req_id=b4fd2fd39742a3ee&cms_redirect=yes&mm=34&mn=sn-a5meknee&ms=ltu&mt=1546607964&mv=m" type="video/mp4" size="720">
                    <!-- <source :src="getOneMovie.clip_FHD" type="video/mp4" size="1080"> -->
                    <!-- <track kind="captions" label="English" srclang="en" src="captions-en.vtt" default> -->
                </video>
            </vue-plyr>
       </transition>
    </div>
</template>

<script>
import { mapGetters } from "vuex"
export default {
    name: "videos",
    data(){
        return {
            checkvideos: true,
        }
    },
    computed: {
        ...mapGetters(['getOneMovie'])
    },
    methods: {
        demo(){
            
            this.checkvideos = false
        }
    },
    created(){
        
    },
   
}
</script>
<style lang="sass" scoped>
    .plyr__poster
        border: 5px solid 
</style>


