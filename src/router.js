import Vue from 'vue'
import Router from 'vue-router'

const Home = () => import('@/views/Home.vue');
const Products = () => import('@/views/Products.vue');
const Contact = () => import('@/views/Contact.vue');
const Info = () => import('@/views/Info.vue');
const Login  = () => import('./views/StudentLogin.vue');
const AdminLogin  = () => import('./views/AdminLogins.vue');
const Register  = () => import('./views/RegisterStudent.vue');
const Tutor = () => import('./views/Tutor.vue');
const Course = () => import('./views/Course.vue');

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/home',
      name: 'Home',
      component: Home
    },{
      path: '/products',
      name: 'Products',
      component: Products
    },
    {
      path: '/contact',
      name: 'Contact',
      component: Contact
    },
    {
      path: '/info',
      name: 'Info',
      component: Info
    },
    {
      path: '/student',
      name: 'StudentLogin',
      component: Login
    },
    {
      path: '/register',
      name: 'Register',
      component: Register
    },
    {
      path: '/admin',
      name: 'AdminLogin',
      component: AdminLogin
    },
    {
      path: '/tutor',
      name: 'Tutor',
      component: Tutor
    }, 
    {
      path: '/tutor',
      name: 'Tutor',
      component: Tutor
    },
    {
      path: '/course',
      name: 'Course',
      component: Course
    },
  ],
  mode: 'history'
})
