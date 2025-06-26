<script lang="ts">
    let { posts = $bindable([]), } = $props();
    import Post from "./Post.svelte";
    import { known_users } from "$lib/store.svelte";

    known_users.set([]);
</script>

<style>
div {
    width: 100%;
    max-width: 700px;
    margin: 0 auto;
}
</style>

<div>
{#each posts as post, i (post.postID)}
    {#await Promise.resolve().then(() => new Promise(r => setTimeout(r, i*10)))}
    <!-- shit -->
    {:then}
    <Post post={post} />
    {/await}
{/each}
</div>