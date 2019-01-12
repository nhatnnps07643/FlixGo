import Vue from 'vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios, axios)

const user = {
  state: {
    user: {
      id: '',
      name: '',
      avatar: ''
    },
    checkuser: false
  },
  mutations: {
    createUser (state, user){
      state.user = user;
      if(user.name != ''){
        state.checkuser = true;
      }else{
        state.checkuser = false;
      }
    },
  },
  getters: {
    getStatusUser(state){
      return state.checkuser;
    },
    async getStatusUserAsync(state){
      return state.checkuser;
    },
    getUser(state){
      return state.user
    },
    async getUserAsync(state){
      return state.user
    },
  },
  actions: {
    createUser(context,user){
      context.commit('createUser',user);
    },
    async createUserAsync(context,user){
      context.commit('createUser',user);
    }
  },
  
}

export default user
