import Vue from 'vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios, axios)

const movie = {
  state: {
    movies: [],
    onemovie: [],
  },
  mutations: { 
    getMovie (state) {
      axios
        .get("http://localhost/REST/API/movie.php/GetAllInfomation")
        .then(response => {
          state.movies = response.data;
        });
    },
    async getMovieAsync (state) {
      axios
        .get("http://localhost/REST/API/movie.php/GetAllInfomation")
        .then(response => {
          state.movies = response.data;
        });
    },
    async getMovieDetailAsync (state, id) {
      axios
        .get("http://localhost/REST/API/movie.php/GetMovieById2?id_movie=" + id)
        .then(response => (state.onemovie = response.data));
    },
    getMovieDetail (state, id) {
      axios
        .get("http://localhost/REST/API/movie.php/GetMovieById2?id_movie=" + id)
        .then(response => (state.onemovie = response.data));
    },
  },
  getters: {
    getOneMovie(state) {
      return state.onemovie;
    },
    GetMovieEvaluate(state) {
      return state.movies
        .sort(function(a, b) {
          if (a.evaluate < b.evaluate) return true;
          else {
            return false;
          }
        })
        .slice(0, 12);
    },
    GetMovieNew(state) {
      return state.movies.slice(0, 12);
    },
    GetMovieFilm(state) {
      return state.movies
        .filter(function(movie) {
          return movie.type == 1;
        })
        .slice(0, 8);
    },
    GetMovieFilms(state) {
      return state.movies
        .filter(function(movie) {
          return movie.type == 0;
        })
        .slice(0, 12);
    },
    GetMovieFilmNew(state) {
      return state.movies
        .sort(function(a, b) {
          if (a.id < b.id && a.type == 1 && b.type == 1) return true;
          else {
            return false;
          }
        })
        .slice(0, 6);
    }
  },
  actions: {
    async getMovie(context) {
      context.commit("getMovie");
    },
    async getMovieDetail(context, id) {
      context.commit("getMovieDetail", id);
    },
  }
};

export default movie