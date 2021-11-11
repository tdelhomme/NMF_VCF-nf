#!/usr/bin/env nextflow

// Copyright (C) 2021 IRB Barcelona

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

params.help = null
params.input_vcf_folder = null
params.mutation_type = null

log.info ""
log.info "-----------------------------------------------------------------------"
log.info "NMF_VCF-nf: pipeline to extract mutational signatures from VCF files   "
log.info "-----------------------------------------------------------------------"
log.info "Copyright (C) IRB Barcelona"
log.info "This program comes with ABSOLUTELY NO WARRANTY; for details see LICENSE"
log.info "This is free software, and you are welcome to redistribute it"
log.info "under certain conditions; see LICENSE for details."
log.info "--------------------------------------------------------"
if (params.help) {
    log.info "--------------------------------------------------------"
    log.info "                     USAGE                              "
    log.info "--------------------------------------------------------"
    log.info ""
    log.info "nextflow run main.nf [OPTIONS]"
    log.info ""
    log.info "Mandatory arguments:"
    log.info "--input_vcf_folder         FOLDER                 Folder containing the VCFs from which mutational signatures will be extracted"
    log.info "--mutation_type            STRING                 Mutation type, either SNV or INDEL"
    log.info ""
    log.info "Optional arguments:"
    log.info ""
    log.info "Flags:"
    log.info "--help                                            Display this message"
    log.info ""
    exit 1
}

assert (params.input_vcf_folder != null) : "please provide the --input_vcf_folder option"
assert (params.mutation_type == "SNV"" || params.mutation_type == "INDEL") : "please provide the --mutation_type option, either SNV or INDEL"

log.info "Input VCF: ${params.vcf_folder}"
log.info "Mutation type: ${params.mutation_type}"

vcfs = Channel.fromPath(params.input_vcf_folder + '/*.vcf.gz' )

process NMF {

  tag {vcfname}

  publishDir params.output_folder, mode: 'copy'

  input:
  file vcf from vcfs

  output:
  file '*pdf' into output1

  shell:
  vcfname=vcf.baseName
  '''
  echo !{vcf}
  '''
}
