"
I am LRUCache.
I am a Cache.

I am a limited cache that evicts the least recently used entries. My implementation is properly O(1).

Implementation Notes

The key/value pairs in the cache are held as Associations in a DoubleLinkedList, lruList, ordered from least to most recently used.

The keyIndex Dictionary maps from each key to the actual DoubleLink inside lruList holding the matching key/value pair.

New pairs are added at the end of the list.

In case of a hit, a pair gets promoted to the end of the list (most recently used).

In case of a full cache, the first pair of the list gets evicted (least recently used).

See #validateInvariantWith: where the relationship between the 2 datastructures is checked.


Example 1

Suppose we have to compute the prime factors of some numbers, 
and that this is a slow operation. If we repeatedly do the same
computation, we could speed this up with a cache.

To get a reasonable hit rate, we generate 50 random numbers below 100.""

	primeFactorsCache := LRUCache new.
	
	50 timesRepeat: [
		| n |
		n := 100 atRandom.
		primeFactorsCache
			at: n ifAbsentPut: [ n primeFactors ] ].
	
	primeFactorsCache hitRatio asFloat.

Example 2

Fibonacci numbers are defined as follows:

 F(0)=0
 F(1)=1
 F(n)=F(n-1)+F(n-2)

This is a relatively slow recursive process, especially
since the same number is computed more than once,
a cache can help. Let's find out the hit rate.

Setting a factory block is an alternative way to define
a cache's functionality in one single place.""	

	fibCache := LRUCache new.

	fibCache 
		maximumWeight: 32;
		factory: [ :key |
			key < 2
				ifTrue: [ key ]
				ifFalse: [ (fibCache at: key - 1) + (fibCache at: key - 2) ] ].

	fibCache at: 40. ""102334155""

	fibCache hitRatio asFloat.
"
Class {
	#name : 'LRUCache',
	#superclass : 'AbstractCache',
	#instVars : [
		'lruList',
		'keyIndex'
	],
	#category : 'System-Caching',
	#package : 'System-Caching'
}


{ #category : 'enumerating' }
LRUCache >> keys [

	^ keyIndex keys
]

