cwlVersion: cwl:draft-3
class: CommandLineTool

baseCommand: [/cga/fh/pcawg_pipeline/modules/VariantBam/variant_160329]

hints:
  - class: DockerRequirement
    dockerPull: oxog:june2016

requirements:
  - class: InlineJavascriptRequirement

inputs:
  - id: bam
    type: File
    inputBinding:
      position: 1
    secondaryFiles:
      - .bai
  - id: vcfs
    type:
      type: array
      items: File
      inputBinding:
        valueFrom: $(["-P", "10", "-l", self])
    inputBinding:
      position: 2
  - id: outname
    type: string
    default: output.bam
    inputBinding:
      prefix: -o
      position: 3

outputs:
  - id: outbam
    type: File
    outputBinding:
      glob: output.bam