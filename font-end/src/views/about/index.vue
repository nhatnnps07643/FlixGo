<template>
    <div id="about">
        <aboutUs></aboutUs>
        <flixGo></flixGo>
        <howitworks></howitworks>
        <partners></partners>
    </div>
</template>
<script>
import aboutUs from '@/components/Layout/about/aboutus.vue'
import flixGo from '@/components/Layout/about/flixgo.vue'
import howitworks from '@/components/Layout/about/howitworks.vue'
import partners from '@/components/Layout/home/partners.vue'
export default {
    name: 'About',
    components: {
        aboutUs, flixGo, howitworks, partners
    }
}
</script>
