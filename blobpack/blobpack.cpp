#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "blob.h"
typedef struct
{
  char *part_name;
  char *filename;
} partition_item;

// Number of required arguments before partition definition, including argv[0]
#define GENERIC_ARGS 2

int
main (int argc, char **argv)
{
  header_type hdr;
  char *outname;
  int i, partnums;
  partition_item *partitions,*curr_part;
  FILE *outfile;
  part_type *parts;

  memset (&hdr, 0, sizeof (header_type));

  if (argc < (GENERIC_ARGS+2)) // Require at least one partition
    {
      fprintf (stderr,"Usage: %s <outfile> <partitionname> <partitionfile> ...\n", argv[0]);
      fprintf(stderr, "Any number of partitionname partitionfilename entries can be entered\n");
      return -1;
    }

  outname = argv[1];
  partnums = argc - GENERIC_ARGS;

  if(partnums <= 0 || partnums % 2 != 0)
  {
    fprintf(stderr, "Error in parameters. There needs to be equal partition names and partition filenames.");
    return -1;
  }
  // Two parameters per partition.
  // At this point we know there is a dividable-by-two number of parameters left
  partnums = partnums / 2;
  printf("Found %d partitions as commandline arguments\n", partnums);
  partitions = (partition_item*)calloc(partnums, sizeof(partition_item));
  curr_part = partitions;
  for(i=GENERIC_ARGS; i<argc; i+=2)
  {
    printf("Partname: %s Filename: %s\n", argv[i], argv[i+1]);
    curr_part->part_name = argv[i];
    curr_part->filename = argv[i+1];
    curr_part++;
  };

  memcpy(hdr.magic, MAGIC, MAGIC_SIZE);
  hdr.version = 0x00010000; // Taken from
  hdr.size = hdr.part_offset = sizeof(header_type);
  hdr.num_parts = partnums;


  outfile = fopen (outname, "wb");
  fwrite (&hdr, sizeof (header_type), 1, outfile);
  printf ("Size: %d\n", hdr.size);
  printf ("%d partitions starting at offset 0x%X\n", hdr.num_parts,
	  hdr.part_offset);

  parts = (part_type *)calloc (hdr.num_parts, sizeof (part_type));
  memset(parts, 0, sizeof(part_type)*hdr.num_parts);
  int currentOffset = sizeof(header_type)+sizeof(part_type)*hdr.num_parts;
  printf("Offset: %d\n", currentOffset);
  
  size_t max_filesize = 0;
  for (i = 0; i < (int)hdr.num_parts; i++)
  {
      FILE *curfile = fopen (partitions[i].filename, "rb");
      long fsize;
      memcpy(parts[i].name, partitions[i].part_name, PART_NAME_LEN);
      parts[i].version = 1; // Version. OK to stay at 1 always.
      parts[i].offset = currentOffset;

      if(curfile == NULL)
      {
        fprintf(stderr,"Error opening file %s\n", partitions[i].filename);
        return 0;
      }
      fseek (curfile, 0, SEEK_END);
      fsize = ftell (curfile);
      fclose (curfile);
      parts[i].size = fsize;
      max_filesize = max_filesize < fsize ? fsize : max_filesize; // compute the maximum size of the files in the set
      currentOffset += fsize;
    }

  fwrite (parts, sizeof (part_type), hdr.num_parts, outfile);
  
  char *buffer = (char *) malloc (max_filesize); // alloc once
  for (i = 0; i < (int)hdr.num_parts; i++)
  {
    // TODO: Don't read in full file in one go. Memory usage!!!
    FILE *currFile = fopen (partitions[i].filename, "rb");	// Read in update file
    fread (buffer, 1, parts[i].size, currFile);
    fclose(currFile);
    fwrite (buffer, 1, parts[i].size, outfile);
  };

  free(buffer); // and free!!

  fclose (outfile);
  return 0;
}

