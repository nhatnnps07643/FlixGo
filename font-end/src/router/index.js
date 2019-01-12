import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)
export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: '',
      component: ()=>import('@/views'),
      children: [
        {
          path: "",
          name: "homepage",
          component: () => import("@/views/Home")
        },
        {
          path: '/movie/:id',
          name: 'Movie',
          component: ()=>import('@/views/Movie')
        },
        {
          path: '/notfound',
          name: 'notfound',
          component: () => import('@/views/notfound')
        },
        {
          path: '/about',
          name: 'about',
          component: ()=> import('@/views/about')
        },
        {
          path: '/pricing',
          name: 'pricing',
          component: () => import('@/views/pricings')
        },
        {
          path: '/signup',
          name: 'signup',
          component: ()=> import('@/views/signup')
        }
        ,
        {
          path: '/signin',
          name: 'signin',
          component: ()=>import('@/views/signin')
        }
      ]
    },
  ]
})
