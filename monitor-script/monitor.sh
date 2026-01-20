watch -n 0.5 '
echo "===== RAM =====";
free -h;
#--------------------------------------------------------------------------
echo;
echo "===== CPU ALL CORES (usage %) =====";
mpstat -P ALL 1 1 | awk "
/^Average/ && \$2 ~ /^[0-9]+$/ {
  idle=\$(NF);
  usage=100-idle;

  # 固定宽度：CPU编号占3位（含空格），使用率固定3位整数 + %，整体块宽固定
  # 输出形如：CPU  0:  7%  CPU  1:100%
  printf \"CPU%3s:%3.0f%%  \", \$2, usage;

  c++;
  if (c % 8 == 0) print \"\";
}
END { if (c % 8 != 0) print \"\" }
";
#-------------------------------------------------------------------------
echo;
echo "===== SYSTEM TEMP (amdgpu-pci-c600) =====";
sensors | awk "
/^amdgpu-pci-c600/ {flag=1; next}
flag && /^edge:/ {
  print;
  getline;
  print;
  exit
}
";
#---------------------------------------------------------------------------
echo;
echo "===== GPU =====";
#rocm-smi -u -t --showmemuse;
rocm-smi
'