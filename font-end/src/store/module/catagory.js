import Vue from 'vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios, axios)

const catagory = {
  state: {
    catalog: [],
  },
  mutations: {
    createCatalog (state) {
      axios
      .get('http://localhost/REST/API/catalog.php/GetAllCatalog')
      .then(response => (state.catalog = response.data))
      },
  },
  getters: {
    getCatalog(state) {
        return state.catalog;
    }
  },
  actions: {
    async AsyncreateCatalog (context) {
      context.commit('createCatalog')
    },
    createCatalog (context) {
      context.commit('createCatalog')
    },
  },

}
export default catagory