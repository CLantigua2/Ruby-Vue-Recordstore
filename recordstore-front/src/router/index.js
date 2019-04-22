import Vue from 'vue'
import Router from 'vue-router'
// the @ sign refers to the root directory (instead of going out to come back in)
import Signin from '@/components/Signin.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Signin',
      component: Signin
    }
  ]
})
