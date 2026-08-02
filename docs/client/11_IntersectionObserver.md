# Intersection Observer
The Intersection observer API is a built in browser tool that lets you asynchronously track when an HTML element becomes visible or hiddedn on a user's screen. It detects if a targeted element intersects either the main browser viewport or a specific parent container element. In our application we use this to fetch data's which have next pages.

```tsx
  useEffect(() => {
    const element = loadMoreRef.current;

    if (!element || !hasNextPage || isFetchingNextPage) return;

    const observer = new IntersectionObserver(
      (entries) => {
        const [entry] = entries;

        console.log("entries", entries);

        console.log("entry", entry);

        if (entry.isIntersecting) {
          fetchNextPage();
        }
      },

      // Start loading slightly before the user actually reaches the bottom.
      {
        rootMargin: "200px",
      },
    );

    observer.observe(element);

    return () => {
      observer.disconnect();
    };
  }, [hasNextPage, isFetchingNextPage, fetchNextPage]);
```
In this code, we create a `IntersectionObserver` for load a data
1. Get DOM element: 
`const element = loadMoreRef.current;` earlier we create a `loadMoreRef` for get the `div` element. We store the `div` element in the `element`.

2. Create Intersection Observer:
`IntersectionObserver` is a browser API it job is basically, tell me when an element becomes visible inside another area.
In this case

3. The callback:
`(entries) => {}` - This function runs whenever the intersection state changes. The browser gives you an array called `entries`, each entry contains information about an observerd element. For ex: `entry.isIntersecting` tells you whether the element is currently intersecting the viewport.

4. Get the first entry:
`const [entry] = entries`, this is array destructing. Since you are observing only one element.

5. Check whether it is visible:
`entry.isIntersecting === true` means, the element has entered the observer's area.
Ex:
```text
User scrolling
      ↓
      ↓
      ↓
┌──────────────────────┐
│ Equipment cards      │
│ Equipment cards      │
│ Equipment cards      │
│                      │
│   loadMoreRef        │ ← enters viewport
└──────────────────────┘

entry.isIntersecting
        ↓
       true
```
Then `fetchNextPage();` runs.

6. `rootMargin: "200px"`:
It means pretend the viewport is `200px` larger around the edges for intersection detection.
without it
```
User scrolls
     ↓
     ↓
     ↓
────────────── viewport bottom
     ↓
 loadMoreRef
     ↓
fetch
```
The request starts when the user gets very close to the bottom.
With it, it starts earlier:
```
             200px
        ┌───────────────┐
        │ trigger area  │
────────┴───────────────┴──── viewport
        │               │
        │ Equipment     │
        │ cards         │
        │               │
        │ loadMoreRef   │
        └───────────────┘
```
So the next page starts loading before the user actually reaches the bottom.

7. Start observing the element:
`observer.observe(element);`, We created the observer but it doesn't know what element to watch yet. This one is used to watch which one we observe.

8. Cleanup function:
```ts
return () => {
  observer.disconnect();
};
```
When the effect needs to run again or the component unmounts, React executes the cleanup function. It disconnects the observer. Without cleanup, you could leave observers running unnecessarily.
Ex: 
```
Component mounted
    ↓
Observer created
    ↓
Component updates
    ↓
Old observer should be removed
    ↓
disconnect()
```
9. Summary:
Watch the element at the bottom of my list, and when it gets within 200px of the viewport, fetch the next page—but only if another page exists and I am not already fetching one.