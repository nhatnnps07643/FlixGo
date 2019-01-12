import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.use(Vuex)
Vue.use(VueAxios, axios)

import catagory from "@/store/module/catagory.js"
import comment from "@/store/module/comment.js"
import country from "@/store/module/country.js"
import global from "@/store/module/global.js"
import movie from "@/store/module/movie.js"
import status from "@/store/module/status.js"
import user from "@/store/module/user.js"
export default new Vuex.Store({
  modules: {
    catagory,
    comment,
    country,
    global,
    movie,
    status,
    user
  }
})
