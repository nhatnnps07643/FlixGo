<template>
    <div class="notification">
        <h2>Đang nạp dữ liệu ... </h2>
    </div>
</template>

<script>
export default {
    data(){
        return {

        }
    },
    created(){
    }

}
</script>
<style lang="sass" scoped>
    .notification
        position: absolute
        z-index: 100
        top: 50%
        transform: translateY(-50%)
        width: 100%
        h2
            color: #fff
            text-align: center
            padding: 0rem 1rem
</style>

