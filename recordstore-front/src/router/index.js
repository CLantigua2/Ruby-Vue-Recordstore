import Vue from 'vue'
import Router from 'vue-router'
// the @ sign refers to the root directory (instead of going out to come back in)
import Signin from '@/components/Signin.vue'
import Signup from '@/components/Signup.vue'
import Artists from '@/components/artists/Artists.vue'
import Records from '@/components/records/Records.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/artist',
      name: 'Artists',
      component: Artists
    },
    {
      path: '/records',
      name: 'Records',
      component: Records
    },
    {
      path: '/',
      name: 'Signin',
      component: Signin
    },
    {
      path: '/signup',
      name: 'Signup',
      component: Signup
    }
  ]
})
