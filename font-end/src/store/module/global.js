import Vue from 'vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios, axios)
const global = {
    state: {
        urlApi: 'http://localhost/rest/page/public/img/',
        scroll: 0,
      },
      mutations: {
        setScoll(state,scroll){
          state.scroll = scroll
        },
        
      },
      getters: {
        getUrlImage(state){
          return state.urlApi;
        },
        scroll(state){
          return state.scroll;
        },
      },
      actions: {
        setScoll(context,scroll){
          context.commit('setScoll',scroll);
        }
      }
}
export default global