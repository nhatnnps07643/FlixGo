import Vue from "vue";
import axios from "axios";
import VueAxios from "vue-axios";
Vue.use(VueAxios, axios);

const country = {
  state: {
    country: []
  },
  mutations: {
    getCountry(state) {
      axios
        .get("http://localhost/REST/API/country.php/country")
        .then(response => (state.country = response.data));
    }
  },
  getters: {
    getCountry(state) {
      return state.country;
    },
    async getCountryAsync(state) {
      return state.country;
    }
  },
  actions: {
    getCountry(context) {
      context.commit("getCountry");
    },
    async getCountryAsync(context) {
      context.commit("getCountry");
    }
  }
};

export default country;
