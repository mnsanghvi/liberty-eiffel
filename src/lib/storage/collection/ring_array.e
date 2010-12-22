-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class RING_ARRAY[E_]
	--
	-- The main purpose of the RING_ARRAY implementation is to allow efficient manipulation of the queue
	-- concept (i.e. using for example `add_last' / `first' / `remove_first'). Actually, the RING_ARRAY
	-- implementation provides very good performance for all of the following features: `add_last', `last',
	-- `remove_last', `add_first', `first', `remove_first'.
	-- Furthermore, the RING_ARRAY implementation also has a common point with traditional ARRAY: the `lower'
	-- bound can be any arbitrary value, even a negative one.
	-- As ARRAY or FAST_ARRAY, the RING_ARRAY uses only one chunk of memory, the `storage' area which is a
	-- NATIVE_ARRAY. This internal `storage' area is used in a circular way (no left- or right-alignment),
	-- hence the very good performances for using it as a queue. Finally, if you have to perform many insertions
	-- in the middle of your COLLECTION, do not expect good performance with a RING_ARRAY, but consider
	-- LINKED_LIST or TWO_WAY_LINKED_LIST.
	--

inherit
	COLLECTION[E_]

insert
	ARRAYED_COLLECTION[E_]
		redefine first, to_external
		end
	NATIVE_ARRAY_COLLECTOR[E_]
		undefine out_in_tagged_out_memory
		end

creation {ANY}
	make, with_capacity, from_collection, manifest_creation

feature {ANY}
	lower: INTEGER
			-- Lower index bound

feature {ANY} -- Creation and Modification:
	make (min_index, max_index: INTEGER) is
			-- Prepare the array to hold values for indexes in range
			-- [`min_index' .. `max_index']. Set all values to default.
			-- When `max_index' = `min_index' - 1, the array `is_empty'.
		require
			valid_bounds: min_index <= max_index + 1
		local
			needed: INTEGER
		do
			lower := min_index
			upper := max_index
			needed := max_index - min_index + 1
			storage_lower := 0
			if needed > 0 then
				if capacity < needed then
					storage := storage.calloc(needed)
					capacity := needed
				else
					clear_all
				end
			end
			next_generation
		ensure
			left_aligned: storage_lower = 0
			lower_set: lower = min_index
			upper_set: upper = max_index
			items_set: all_default
		end

	with_capacity (needed_capacity, low: INTEGER) is
			-- Create an empty array with `capacity' initialized
			-- at least to `needed_capacity' and `lower' set to `low'.
		require
			needed_capacity >= 0
		do
			if capacity < needed_capacity then
				storage := storage.calloc(needed_capacity)
				capacity := needed_capacity
			end
			lower := low
			upper := low - 1
			storage_lower := 0
			next_generation
		ensure
			left_aligned: storage_lower = 0
			empty: is_empty
			big_enough: needed_capacity <= capacity
			lower_set: lower = low
		end

feature {ANY} -- Modification:
	resize (min_index, max_index: INTEGER) is
			-- Resize to bounds `min_index' and `max_index'. Do not lose any
			-- item whose index is in both [`lower' .. `upper'] and
			-- [`min_index' .. `max_index']. New positions if any are
			-- initialized with the appropriate default value.
		require
			min_index <= max_index + 1
		local
			bubble, old_wrap, needed, inter_max, inter_min: INTEGER
		do
			needed := max_index - min_index + 1
			if needed > 0 then
				bubble := needed - capacity
				if needed > capacity then
					old_wrap := wrap_point
					if capacity = 0 then
						storage := storage.calloc(needed)
					else
						storage := storage.realloc(capacity, needed)
					end
					capacity := needed
				end
				inter_max := max_index.min(upper)
				inter_min := min_index.max(lower)
				if inter_max >= inter_min then
					if old_wrap.in_range(inter_min, inter_max) then
						if bubble > 0 then
							-- A bubble was created inside the data. Update upper to acknowledge this (preconditions
							-- will fail if we don't)
							upper := upper + bubble
							squeeze_bubble(inter_min, inter_max + bubble, old_wrap, bubble)
							-- Upper is written below, no need to re-adjust
						end
					end
					storage_lower := storage_lower - lower + min_index
					if storage_lower < 0 then
						storage_lower := storage_lower + capacity
					elseif storage_lower >= capacity then
						storage_lower := storage_lower - capacity
					end
					lower := min_index
					upper := max_index
					if inter_min > lower then
						clear_slice(lower, inter_min - 1)
					end
					if inter_max < upper then
						clear_slice(inter_max + 1, upper)
					end
				else
					lower := min_index
					upper := max_index
					clear_all
				end
			else
				lower := min_index
				upper := max_index
			end
			next_generation
		ensure
			lower = min_index
			upper = max_index
		end

	reindex (new_lower: INTEGER) is
			-- Change indexing to take in account the expected `new_lower'
			-- index. The `upper' index is translated accordingly.
		do
			upper := upper + new_lower - lower
			lower := new_lower
		ensure
			lower = new_lower
			count = old count
		end

feature {ANY} -- Implementation of deferred:
	count: INTEGER is
		do
			Result := upper - lower + 1
		end

	is_empty: BOOLEAN is
		do
			Result := upper < lower -- *** Is there a better implementation ? *** Dom march  30th 2006 ***
		end

	subarray (min, max: INTEGER): like Current is
		do
			Result := slice(min, max)
			Result.reindex(min)
		ensure then
			Result.lower = min
		end

	item (i: INTEGER): E_ is
		do
			Result := storage.item(storage_index(i))
		end

	put (element: like item; i: INTEGER) is
		do
			storage.put(element, storage_index(i))
			next_generation
		end

	force (element: like item; index: INTEGER) is
		require else
			True
		do
			if upper < index then
				if index = upper + 1 then
					add_last(element)
				else
					resize(lower, index)
					put(element, index)
				end
			elseif index < lower then
				if index = lower - 1 then
					add_first(element)
					reindex(lower - 1)
				else
					resize(index, upper)
					put(element, index)
				end
			else
				put(element, index)
			end
		ensure then
			lower = index.min(old lower)
		end

	copy (other: like Current) is
		local
			needed_capacity, o_s_u: INTEGER
		do
			storage_lower := 0
			lower := other.lower
			upper := other.upper
			needed_capacity := upper - lower + 1
			if capacity < needed_capacity then
				storage := storage.calloc(needed_capacity)
				capacity := needed_capacity
			end
			if needed_capacity > 0 then
				o_s_u := other.storage_upper
				if o_s_u >= other.storage_lower then
					storage.slice_copy(0, other.storage, other.storage_lower, o_s_u)
				else
					storage.slice_copy(0, other.storage, other.storage_lower, other.capacity - 1)
					storage.slice_copy(other.capacity - other.storage_lower, other.storage, 0, o_s_u)
				end
			end
			next_generation
		end

	set_all_with (v: like item) is
		local
			s_u: INTEGER
		do
			if is_empty then
			else
				s_u := storage_upper
				if storage_lower <= s_u then
					storage.set_slice_with(v, storage_lower, s_u)
				else
					storage.set_all_with(v, s_u)
					storage.set_slice_with(v, storage_lower, capacity - 1)
				end
			end
			next_generation
		end

	remove_first is
		do
			lower := lower + 1
			storage_lower := storage_lower + 1
			if storage_lower = capacity then
				storage_lower := 0
			end
			next_generation
		ensure then
			upper = old upper
		end

	remove_head (n: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := n
			until
				i = 0
			loop
				remove_first
				i := i - 1
			end
			next_generation
		ensure then
			upper = old upper
		end

	remove (index: INTEGER) is
		do
			if index /= upper then
				if index /= lower then
					squeeze_bubble(lower, upper, index, 1)
				else
					storage_lower := storage_lower + 1
					if storage_lower = capacity then
						storage_lower := 0
					end
				end
			end
			upper := upper - 1
			next_generation
		end

	clear_count is
		do
			upper := lower - 1
			next_generation
		ensure then
			capacity = old capacity
		end

	clear_count_and_capacity is
		local
			null_storage: like storage
		do
			upper := lower - 1
			storage := null_storage
			capacity := 0
			next_generation
		ensure then
			capacity = 0
		end

	add_first (element: like item) is
		do
			make_space_for_one
			upper := upper + 1
			storage_lower := storage_lower - 1
			if storage_lower < 0 then
				storage_lower := storage_lower + capacity
			end
			storage.put(element, storage_lower)
			next_generation
		end

	add_last (element: like item) is
		do
			make_space_for_one
			upper := upper + 1
			put(element, upper)
		end

	from_collection (model: TRAVERSABLE[like item]) is
		local
			i, up: INTEGER
		do
			from
				with_capacity(model.count, model.lower)
				i := model.lower
				up := model.upper
			until
				i > up
			loop
				add_last(model.item(i))
				i := i + 1
			end
			next_generation
		ensure then
			lower = model.lower
			upper = model.upper
		end

	all_default: BOOLEAN is
		local
			s_u: INTEGER
		do
			if is_empty then
				Result := True
			else
				s_u := storage_upper
				if storage_lower <= s_u then
					Result := storage.slice_default(storage_lower, s_u)
				else
					Result := storage.all_default(s_u) and then storage.slice_default(storage_lower, capacity - 1)
				end
			end
		end

	occurrences (element: like item): INTEGER is
		local
			s_u: INTEGER
		do
			if is_empty then
			else
				s_u := storage_upper
				if storage_lower <= s_u then
					Result := storage.slice_occurrences(element, storage_lower, s_u)
				else
					Result := storage.occurrences(element, s_u) + storage.slice_occurrences(element, storage_lower, capacity - 1)
				end
			end
		end

	fast_occurrences (element: like item): INTEGER is
		local
			s_u: INTEGER
		do
			if is_empty then
			else
				s_u := storage_upper
				if storage_lower <= s_u then
					Result := storage.slice_fast_occurrences(element, storage_lower, s_u)
				else
					Result := storage.fast_occurrences(element, s_u) + storage.slice_fast_occurrences(element, storage_lower, capacity - 1)
				end
			end
		end

	first_index_of (element: like item): INTEGER is
		local
			s_u: INTEGER
		do
			if is_empty then
				Result := upper + 1
			else
				s_u := storage_upper
				if storage_lower <= s_u then
					Result := storage.index_of(element, storage_lower, s_u) + lower - storage_lower
				else
					Result := storage.index_of(element, storage_lower, capacity - 1)
					if Result = capacity then
						Result := storage.first_index_of(element, s_u) + upper - s_u
					else
						Result := Result + lower - storage_lower
					end
				end
			end
		end

	index_of (element: like item; start_index: INTEGER): INTEGER is
		local
			s_start_index, s_u: INTEGER
		do
			if is_empty then
				Result := upper + 1
			else
				s_u := storage_upper
				s_start_index := storage_index(start_index)
				if s_start_index <= s_u then
					Result := storage.index_of(element, s_start_index, s_u) + lower - storage_lower
				else
					Result := storage.index_of(element, s_start_index, capacity - 1)
					if Result = capacity then
						Result := storage.first_index_of(element, s_u) + upper - s_u
					else
						Result := Result + lower - storage_lower
					end
				end
			end
		end

	reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
		local
			safe_equal: SAFE_EQUAL[E_]
		do
			from
				Result := start_index
			until
				Result < lower or else safe_equal.test(item(Result), element)
			loop
				Result := Result - 1
			end
		end

	fast_first_index_of (element: like item): INTEGER is
		local
			s_u: INTEGER
		do
			if is_empty then
				Result := upper + 1
			else
				s_u := storage_upper
				if storage_lower <= s_u then
					Result := storage.fast_index_of(element, storage_lower, s_u) + lower - storage_lower
				else
					Result := storage.fast_index_of(element, storage_lower, capacity - 1)
					if Result = capacity then
						Result := storage.fast_first_index_of(element, s_u) + upper - s_u
					else
						Result := Result + lower - storage_lower
					end
				end
			end
		end

	fast_index_of (element: like item; start_index: INTEGER): INTEGER is
		local
			s_start_index, s_u: INTEGER
		do
			if is_empty then
				Result := upper + 1
			else
				s_u := storage_upper
				s_start_index := storage_index(start_index)
				if s_start_index <= s_u then
					Result := storage.fast_index_of(element, s_start_index, s_u) + lower - storage_lower
				else
					Result := storage.fast_index_of(element, s_start_index, capacity - 1)
					if Result = capacity then
						Result := storage.fast_first_index_of(element, s_u) + upper - s_u
					else
						Result := Result + lower - storage_lower
					end
				end
			end
		end

	fast_reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
		do
			from
				Result := start_index
			until
				Result < lower or else item(Result) = element
			loop
				Result := Result - 1
			end
		end

	is_equal (other: like Current): BOOLEAN is
		local
			wp, owp: INTEGER
		do
			if Current = other then
				Result := True
			elseif lower = other.lower and then upper = other.upper then
				wp := wrap_point
				owp := other.wrap_point
				if wp < owp then
					Result := other.slices_are_equal(Current, owp, wp)
				else
					Result := slices_are_equal(other, wp, owp)
				end
			end
		end

	is_equal_map (other: like Current): BOOLEAN is
		local
			wp, owp: INTEGER
		do
			if Current = other then
				Result := True
			elseif lower = other.lower and then upper = other.upper then
				wp := wrap_point
				owp := other.wrap_point
				if wp < owp then
					Result := other.slices_are_equal_map(Current, owp, wp)
				else
					Result := slices_are_equal_map(other, wp, owp)
				end
			end
		end

	slice (min, max: INTEGER): like Current is
		local
			storage_min, storage_max: INTEGER
		do
			create Result.make(lower, lower + max - min)
			if max >= min then
				storage_min := storage_index(min)
				storage_max := storage_index(max)
				if storage_max >= storage_min then
					Result.storage.slice_copy(0, storage, storage_min, storage_max)
				else
					Result.storage.slice_copy(0, storage, storage_min, capacity - 1)
					Result.storage.slice_copy(capacity - storage_min, storage, 0, storage_max)
				end
			end
		end

	new_iterator: ITERATOR[E_] is
		do
			create {ITERATOR_ON_TRAVERSABLE[E_]} Result.make(Current)
		end

	first: like item is
		do
			Result := storage.item(storage_lower)
		end

feature {}
	make_space_for_one is
			-- Make sure `storage' is big enough to hold at least one
			-- more element.
		local
			old_capacity, s_u, wp: INTEGER
		do
			if capacity < count + 1 then
				if capacity = 0 then
					capacity := 16
					storage := storage.calloc(capacity)
				else
					wp := wrap_point
					s_u := storage_upper
					old_capacity := capacity
					capacity := 2 * capacity
					storage := storage.realloc(old_capacity, capacity)
					if s_u < storage_lower then
						-- A bubble was created inside the data. Update upper to acknowledge this (preconditions
						-- will fail if we don't)
						upper := upper + capacity - old_capacity
						squeeze_bubble(lower, upper, wp, capacity - old_capacity)
						-- Update upper
						upper := upper - capacity + old_capacity
					end
				end
			end
			next_generation
		end

	clear_slice (min, max: INTEGER) is
		require
			valid_index(min)
			valid_index(max)
		local
			s_min, s_max: INTEGER
		do
			if max >= min then
				s_min := storage_index(min)
				s_max := storage_index(max)
				if s_max >= s_min then
					storage.clear(s_min, s_max)
				else
					storage.clear(s_min, capacity - 1)
					storage.clear(0, s_max)
				end
			end
			next_generation
		end

	squeeze_bubble (min, max, pos, length: INTEGER) is
		require
			valid_index(min)
			valid_index(max)
			pos.in_range(min + 1, max - length)
			length > 0
		do
			if pos - min <= max - pos - length then
				move(min, pos - 1, length)
				storage_lower := storage_lower + length
				if storage_lower >= capacity then
					storage_lower := storage_lower - capacity
				end
			else
				move(pos + length, max, -length)
			end
			next_generation
		end

	unwrap is
		local
			bottom, top, free, old_bound, overlap: INTEGER; tmp: like storage
		do
			if is_wrapped then
				bottom := wrap_point - lower
				top := upper - wrap_point + 1
				free := capacity - count
				if free >= bottom then
					old_bound := upper
					upper := upper + bottom
					move(lower, old_bound, bottom)
					storage_lower := 0
					upper := old_bound
				elseif free >= top then
					old_bound := lower
					lower := lower - top
					storage_lower := storage_lower - top
					move(old_bound, upper, -top)
					lower := old_bound
				elseif bottom <= top then
					overlap := bottom - free
					tmp := tmp.calloc(overlap)
					tmp.slice_copy(0, storage, storage_lower, storage_lower + overlap - 1)
					old_bound := upper
					lower := lower + overlap
					storage_lower := storage_lower + overlap
					upper := upper + bottom
					move(lower, old_bound, bottom)
					upper := old_bound
					storage.slice_copy(0, tmp, 0, overlap - 1)
					lower := lower - overlap
					storage_lower := 0
				else
					overlap := top - free
					tmp := tmp.calloc(overlap)
					tmp.slice_copy(0, storage, storage_upper - overlap + 1, storage_upper)
					old_bound := lower
					lower := lower - top
					storage_lower := storage_lower - top
					upper := upper - overlap
					move(old_bound, upper, -top)
					lower := old_bound
					storage.slice_copy(storage_upper + 1, tmp, 0, overlap - 1)
					upper := upper + overlap
				end
			end
			next_generation
		ensure
			not is_wrapped
			is_equal(old twin)
		end

feature {ANY}
	to_external: POINTER is
			-- Gives C access into the internal `storage' of the ARRAY.
			-- Result is pointing the element at index `lower'.
			--
			-- NOTE: do not free/realloc the Result. Any operation that changes
			--       `lower' or `upper' can make this pointer useless (because the
			--       array has wrapped or its beginning in the storage has moved),
			--       and operations that change `capacity' can make it invalid
			--       (because new memory has been allocated and the old memory has
			--       been freed)
		do
			unwrap
			Result := storage.to_pointer + storage_lower * storage.element_sizeof
		ensure then
			not is_wrapped
		end

	is_wrapped: BOOLEAN is
		do
			Result := storage_lower + count > capacity
		ensure
			Result = (not is_empty and then storage_lower > storage_upper)
		end

feature {RING_ARRAY}
	storage_lower: INTEGER
			-- Index of `first' in `storage'
			-- This would always be 0 for regular arrays.

	storage_upper: INTEGER is
			-- Index of `last' in `storage'
		require
			not is_empty
		do
			Result := storage_index(upper)
		ensure
			in_storage(Result)
		end

	storage_index (i: INTEGER): INTEGER is
			-- Index in `storage' corresponding to index `i' in `Current'
		require
			valid_index(i)
		do
			Result := i - lower + storage_lower
			if Result >= capacity then
				Result := Result - capacity
			end
		ensure
			in_storage(Result)
		end

	in_storage (index: INTEGER): BOOLEAN is
		do
			Result := index.in_range(0, capacity - 1)
		ensure
			Result = (0 <= index and index < capacity)
		end

	wrap_point: INTEGER is
			-- Index in Current (seen as a COLLECTION) such that for any
			-- `valid_index'es i and j, if i < wrap_point and j >=
			-- wrap_point then storage_index(i) > storage_index(j)
			--
			-- This can happen because of the circular nature of the
			-- array. `wrap_point' is not a `valid_index' if and only if
			-- there is no such point (i.e. the array doesn't wrap).
		do
			Result := capacity + lower - storage_lower
		ensure
			capacity > 0 implies Result > lower
			valid_index(Result) = is_wrapped
		end

	slices_are_equal (other: like Current; wp, owp: INTEGER): BOOLEAN is
		require
			wp >= owp
			lower = other.lower
			upper = other.upper
		local
			oswp: INTEGER
		do
			if owp > upper then
				Result := storage.slice_fast_memcmp(storage_lower, other.storage, other.storage_lower, other.storage_upper)
			elseif wp > upper or else wp = owp then
				Result := storage.slice_fast_memcmp(storage_lower, other.storage, other.storage_lower, other.capacity - 1) and then storage.slice_fast_memcmp(storage_index(owp), other.storage, 0, other.storage_upper)
			else
				oswp := other.storage_index(wp)
				Result := storage.slice_fast_memcmp(storage_lower, other.storage, other.storage_lower, other.capacity - 1) and then storage.slice_fast_memcmp(storage_index(owp), other.storage, 0, oswp - 1) and then storage.slice_fast_memcmp(0, other.storage, oswp, other.storage_upper)
			end
		end

	slices_are_equal_map (other: like Current; wp, owp: INTEGER): BOOLEAN is
		require
			wp >= owp
			lower = other.lower
			upper = other.upper
		local
			oswp: INTEGER
		do
			if owp > upper then
				Result := storage.slice_memcmp(storage_lower, other.storage, other.storage_lower, other.storage_upper)
			elseif wp > upper or else wp = owp then
				Result := storage.slice_memcmp(storage_lower, other.storage, other.storage_lower, other.capacity - 1) and then storage.slice_memcmp(storage_index(owp), other.storage, 0, other.storage_upper)
			else
				oswp := other.storage_index(wp)
				Result := storage.slice_memcmp(storage_lower, other.storage, other.storage_lower, other.capacity - 1) and then storage.slice_memcmp(storage_index(owp), other.storage, 0, oswp - 1) and then storage.slice_memcmp(0, other.storage, oswp, other.storage_upper)
			end
		end

feature {} -- Garbage collector tuning (very low-level):
	mark_native_arrays is
			-- For performance reasons, the unused area of `storage' is always left as it is when
			-- some elements are removed. No time is lost to clean the released area with a Void
			-- or a 0 value. (Look for example the `remove_last' implementation.)
			-- Thus, the unused area of `storage' may contains references of actually unreachable
			-- objects. The following `mark_native_arrays' actually replace the
			-- default behavior (the call is automatic) in order to mark only reachable objects.
			--
			-- See also class GARBAGE_COLLECTOR_TUNING.
		local
			i: INTEGER
		do
			if not is_empty then
				if is_wrapped then
					from
						i := capacity - 1
					until
						i < storage_lower
					loop
						mark_item(storage, i)
						i := i - 1
					end
					from
						i := storage_upper
					until
						i < 0
					loop
						mark_item(storage, i)
						i := i - 1
					end
				else
					from
						i := storage_upper
					until
						i < storage_lower
					loop
						mark_item(storage, i)
						i := i - 1
					end
				end
			end
		end

feature {} -- Implement manifest generic creation (very low-level):
	manifest_make (needed_capacity: INTEGER; initial_lower: INTEGER) is
			-- Manifest creation of a RING_ARRAY `lower' set to `initial_lower'.
		do
			make(initial_lower, initial_lower + needed_capacity - 1)
		end

	manifest_put (index: INTEGER; element: like item) is
		do
			storage.put(element, index)
		ensure
			item(index + lower) = element
		end

invariant
	is_empty or in_storage(storage_lower)

end -- class RING_ARRAY
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
