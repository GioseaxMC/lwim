<script lang="ts">
    import "$lib/env.svelte";
    import { user, api, base } from "$lib/store.svelte.js";
    // import { error } from "@sveltejs/kit";
    import { onMount } from "svelte";
    
    import Input from "$lib/components/ui/Input.svelte";
    import Button from "$lib/components/ui/Button.svelte";
    import Post from "$lib/components/ui/Post.svelte";
    import Posts from "$lib/components/ui/Posts.svelte";

    let posts = $state([]);

    const data = { limit: 100 };

    let urpost = $state("");
    let error_message = $state("");

    onMount(()=>{
        fetch(
            api + "get_posts.php", {
            method: "POST",
            body: JSON.stringify(data),
        }).then(response => {
            if ( response.status >= 200 && response.status < 300 ) {
                response.json().then(json => {
                    posts = json.map(obj => {
                        const { CodUser, ...rest } = obj;
                        return { user: CodUser, ...rest };
                    });
                })
            } else {
                posts = [{
                    content: "Error retrieving messages"
                }];
            }
        });
    });


    function handle_post(e) {
        e.preventDefault();
        let formdata = new FormData(e.target);
        formdata.append("usertoken", user.token);

        if (!urpost.length) {
            error_message = "Write something";
            return;
        }
        fetch(
            api + "post.php", {
            method: "POST",
            body: formdata,
        }).then( response => {
            if ( response.ok ) {
                response.json().then(json=>{
                
                    posts = [{
                        user: user.id,
                        content: urpost,
                        created_at: "..now",
                        postID: json.postID, 
                    }, ...posts];

                    urpost = "";
                    error_message = "";
                });
            } else {
                response.text().then(text => {
                    error_message = "Error: "+text;
                })
            }
        });
    }

</script>

<style>

.main-container {
    padding: 10px;
    display: flex;
    flex-direction: column;
}

.segment {
    display: flex;
    flex-direction: column;
    border: 1px var(--border) solid;
    border-radius: var(--border-radius);
    padding: 20px;
    margin: 0 auto;
    width: 100%;
    max-width: 700px;
    /* min-height: 100px; */
    margin-bottom: 10px;
    font-size: 90%;
}
</style>

<div class="main-container">
    <div class="segment">
        {#if user.name.length}
            <h4>{user.display}</h4>
            <br>
            <form onsubmit={handle_post}>
                <Input placeholder="Your thoughts here" slass="transparent" name="prompt" bind:buffer={urpost} multiline="true"/>
                <p class="st" style="color: var(--red); margin-bottom: 5px">{error_message}</p>
                <!-- <button type="submit">Post</button> -->
                <Button style="style-1" text="Post" type="submit"/>
            </form>
        {:else}
        <p>
            <a style="color: var(--main);" href="{base}register">register</a>
            or 
            <a style="color: var(--main);" href="{base}login">login</a>
            if you already have an account
        </p>
        {/if}
    </div>
    <Posts posts={posts}/>
</div>