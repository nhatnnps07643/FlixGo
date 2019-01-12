import Vue from "vue";
import axios from "axios";
import VueAxios from "vue-axios";
Vue.use(VueAxios, axios);

const status = {
  state: {
    statusLoading: true,
    statusVideo: false,
    checkuser: false
  },
  mutations: {
    setLoading(state, value) {
      state.statusLoading = value;
    }
  },
  getters: {
    getStatusLoading(state) {
      return state.statusLoading;
    },
    async getStatusLoadingAsync(state) {
      return state.statusLoading;
    }
  },
  actions: {
    setLoading(context, value) {
      context.commit("setLoading", value);
    },
    async setLoadingAsync(context, value) {
      context.commit("setLoading", value);
    }
  }
};
export default status;
