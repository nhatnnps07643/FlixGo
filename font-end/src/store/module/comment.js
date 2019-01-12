import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";
import VueAxios from "vue-axios";

Vue.use(Vuex);
Vue.use(VueAxios, axios);

const comment = {
  state: {
    comments: null
  },
  mutations: {
    getComments(state, idmovie) {
      axios
        .get(
          "http://localhost/REST/API/comment.php/GetCommentByIdMovie?idmovie=" +
            idmovie
        )
        .then(response => {
          state.comments = response.data;
        });
    }
  },
  getters: {
    getComments(state) {
      return state.comments;
    }
  },
  actions: {
    getComments(context, id) {
      context.commit("getComments", id);
    }
  }
};

export default comment