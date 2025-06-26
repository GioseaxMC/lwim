<script>
    let { text = "<Button text='Lorem' />", style="style-1", ...other } = $props();
</script>

<style>

.base {
    color: var(--text-main);
    border: 1px var(--border) solid;
    border-radius: var(--border-radius-2);
    width: 100%;
    padding: 7px;
    font-size: 85%;
}

.style-1 {
    background-color: var(--primary);
    transition: all 0.2s;
}

.style-1:hover {
    background-color: var(--primary-hover);
    transition: all 0.2s;
}

.style-2 {
    background-color: var(--secondary);
    transition: all 0.2s;
}

.style-2:hover {
    background-color: var(--secondary-hover);
    transition: all 0.2s;
}

.style-3 {
    background-color: rgba(0,0,0, 0);
    transition: all 0.2s;
    border: 0;
    text-align: left;
    
}

.style-3:hover {
    background-color: rgba(255,255,255, 0.05);
    transition: all 0.2s;
}
</style>

<button class="base {style}" {...other}>
{text}
</button>