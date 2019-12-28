///@arg list_id
///@arg array

for(var i=0; i<array_length_1d(argument1); i++)
	if ds_list_size(argument0) <= i
		ds_list_insert(argument0, i, argument1[i])
	else
		argument0[| i] = argument1[i]