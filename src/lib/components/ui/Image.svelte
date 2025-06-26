<script>
    let { width, height, alt="image", ...others } = $props();

    let image_class = $state("img-hidden");
    let loader_class = $state("img-circle");
</script>

<style>

.img-circle {
    background-color: var(--border);
    /* width: 40px;
    min-width: 40px;
    height: 40px;
    min-height: 40px; */
    border-radius: 100%;
    margin-right: 10px;
}

.img-hidden {
    display: none;
}

</style>

<div style="width: {width}; min-width: {width}; height: {height}; min-height: {height};" class="{loader_class}"></div>
<img style="width: {width}; min-width: {width}; height: {height}; min-height: {height};" {...others} class="img-circle {image_class}" onload={()=>{image_class="img-circle"; loader_class="img-hidden"}} alt={alt}>