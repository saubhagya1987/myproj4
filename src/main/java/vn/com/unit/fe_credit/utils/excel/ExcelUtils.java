package vn.com.unit.fe_credit.utils.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.FormulaParser;
import org.apache.poi.ss.formula.FormulaRenderer;
import org.apache.poi.ss.formula.FormulaShifter;
import org.apache.poi.ss.formula.FormulaType;
import org.apache.poi.ss.formula.ptg.AreaPtg;
import org.apache.poi.ss.formula.ptg.Ptg;
import org.apache.poi.ss.formula.ptg.RefPtg;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.PrintSetup;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFEvaluationWorkbook;
import org.apache.poi.xssf.usermodel.XSSFPrintSetup;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUtils {
	private FileInputStream is = null;

	public Workbook getWorkbook(String path) throws FileNotFoundException, IOException {
		Workbook workbook;
		// <-Interface, accepts both HSSF and XSSF.
		File file = new File(path);
		is = new FileInputStream(file);
		if (FilenameUtils.getExtension(file.getName()).equalsIgnoreCase("xls")) {
			workbook = new HSSFWorkbook(is);
		} else if (FilenameUtils.getExtension(file.getName()).equalsIgnoreCase("xlsx")) {
			workbook = new XSSFWorkbook(is);
		} else {
			throw new IllegalArgumentException("Received file does not have a standard excel extension.");
		}

		return workbook;
	}

	public void closeInputStream() {
		if (is != null) {
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void fitPrintRangeWidthAndHeight(String path) throws IOException {
		/* FileInputStream fis = null; */
		FileOutputStream fos = null;
		try {
			Workbook workbook;
			workbook = getWorkbook(path);

			Sheet sheet = workbook.getSheetAt(0);
			// Iterate through each rows one by one

			PrintSetup ps = sheet.getPrintSetup();

			sheet.setAutobreaks(true);
			sheet.setFitToPage(true);

			fos = new FileOutputStream(new File(path));
			workbook.write(fos);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally {
			closeInputStream();
		}
		if (fos != null) {
			try {
				fos.flush();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// QUAN: 06/11/2014
	/**
	 * @param workbook
	 * @param row
	 * @param object
	 * @param column
	 * @param styleDouble
	 * @param styleInteger
	 * @param styleString
	 * @param styleDate
	 */
	public void createCell(Row row, Object object, Integer column, CellStyle styleDouble, CellStyle styleInteger, CellStyle styleString, CellStyle styleDate) {
		if (object != null) {
			if (object instanceof Double) {
				Cell cell = row.createCell(column);
				cell.setCellValue((Double) object);
				if (styleDouble != null)
					cell.setCellStyle(styleDouble);
			}
			if (object instanceof Integer) {
				Cell cell = row.createCell(column);
				cell.setCellValue((Integer) object);
				if (styleInteger != null)
					cell.setCellStyle(styleInteger);
			}
			if (object instanceof String) {
				Cell cell = row.createCell(column);
				cell.setCellValue(object.toString());
				if (styleString != null)
					cell.setCellStyle(styleString);
			}
			if (object instanceof Date) {
				Cell cell = row.createCell(column);
				cell.setCellValue((Date) object);
				if (styleDate != null)
					cell.setCellStyle(styleDate);
			}
		} else {
			Cell cell = row.createCell(column);
			cell.setCellValue("");
			if (styleString != null)
				cell.setCellStyle(styleString);
		}
	}
	
	/**
	 * @author toan.nd
	 * @param workbook
	 * @param border
	 * @return
	 */

	@SuppressWarnings({ "unchecked" })
	public static <K, V> Map<K, V> mapFor(Object... mapping) {
		Map<K, V> map = new HashMap<K, V>();
		for (int i = 0; i < mapping.length; i += 2) {
			map.put((K) mapping[i], (V) mapping[i + 1]);
		}
		return map;
	}
	
	public static XSSFCellStyle setStyle(XSSFWorkbook workbook, boolean border) {
		XSSFCellStyle cellStyle = workbook.createCellStyle();
		Font newFont2 = workbook.createFont();
		newFont2.setFontName("Times New Roman");
		newFont2.setFontHeightInPoints((short) 11);
		cellStyle.setFont(newFont2);
		cellStyle.setVerticalAlignment(CellStyle.VERTICAL_TOP);
		if (border) {
			cellStyle.setWrapText(true);
			XSSFColor color = new XSSFColor();
			byte[] a = { (byte) 255, (byte) 255, (byte) 255 };
			color.setRGB(a);
			cellStyle.setBorderBottom(CellStyle.BORDER_THIN);
			cellStyle.setBorderLeft(CellStyle.BORDER_THIN);
			cellStyle.setBorderRight(CellStyle.BORDER_THIN);
			cellStyle.setBottomBorderColor(color);
			cellStyle.setLeftBorderColor(color);
			cellStyle.setRightBorderColor(color);
		}

		return cellStyle;
	}

	public static Cell createXSSFCell(Row row, Integer column, Object object, XSSFCellStyle cellStyle, CreationHelper createHelper) {
		Cell cell = null;
		if (object != null) {
			if (object instanceof Double) {
				cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("_(* #,##0_);_(* (#,##0);_(* \"-\"??_);_(@_)"));
				cell = row.createCell(column, Cell.CELL_TYPE_NUMERIC);
				cell.setCellValue((Double) object);
				cell.setCellStyle(cellStyle);
			}
			if (object instanceof Long) {
				cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("_(* #,##0_);_(* (#,##0);_(* \"-\"??_);_(@_)"));
				cell = row.createCell(column, Cell.CELL_TYPE_NUMERIC);
				cell.setCellValue((Long) object);
				cell.setCellStyle(cellStyle);
			}
			if (object instanceof Integer) {
				cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("General"));
				cell = row.createCell(column, Cell.CELL_TYPE_NUMERIC);
				cell.setCellValue((Integer) object);
				cell.setCellStyle(cellStyle);
			}
			if (object instanceof Short) {
				cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("General"));
				cell = row.createCell(column, Cell.CELL_TYPE_NUMERIC);
				cell.setCellValue((Short) object);
				cell.setCellStyle(cellStyle);
			}
			if (object instanceof String) {
				cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("General"));
				cell = row.createCell(column, Cell.CELL_TYPE_STRING);
				cell.setCellValue(object.toString());
				cell.setCellStyle(cellStyle);
			}
			if (object instanceof Date) {
				cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("mm/dd/yyyy"));
				cell = row.createCell(column, Cell.CELL_TYPE_NUMERIC);
				cell.setCellValue((Date) object);
				cell.setCellStyle(cellStyle);
			}
		} else {
			cell = row.createCell(column, Cell.CELL_TYPE_BLANK);
			cell.setCellValue("");
			cell.setCellStyle(cellStyle);
		}
		return cell;
	}
	
    public static String shiftSumRange(String sumFormula, int numberRowShift, int numberColShift){
        Ptg[] ptg = FormulaParser.parse(sumFormula, null, FormulaType.CELL, 0);
        Ptg[] ptgout = new Ptg[ptg.length];

        for (int i=0;i<ptg.length;i++) {
            Ptg ptgi = ptg[i];
            //System.out.println(ptgi);
            Object objclass = ptg[i].getClass();
            //System.out.println(objclass);
            if (objclass == AreaPtg.class) {
                CellRangeAddress crad = CellRangeAddress.valueOf(ptgi.toFormulaString());

                int fr = crad.getFirstRow();
                int lr = crad.getLastRow();
                int fc = crad.getFirstColumn();
                int lc = crad.getLastColumn();
                if (numberRowShift < 0) {
                    crad.setFirstRow(fr + numberRowShift);
                    crad.setLastRow(lr);
                } else {
                    crad.setFirstRow(fr);
                    crad.setLastRow(lr + numberRowShift);
                }
                if (numberRowShift < 0) {
                    crad.setFirstColumn(fc + numberColShift);
                    crad.setLastColumn(lc);
                } else {
                    crad.setFirstColumn(fc);
                    crad.setLastColumn(lc + numberColShift);
                }

                ptgout[i] = new AreaPtg(crad.formatAsString());
            } else if (objclass == RefPtg.class){
                ptgout[i] = ptgi;
            } else {
                ptgout[i] = ptgi;
            }
        }

        return FormulaRenderer.toFormulaString(null, ptgout);
    }
    
    public static String copyRefFormula(String refFormula, int numberRowShift, int numberColShift){
        Ptg[] ptg = FormulaParser.parse(refFormula, null, FormulaType.CELL, 0);
        Ptg[] ptgout = new Ptg[ptg.length];

        for (int i=0;i<ptg.length;i++) {
            Ptg ptgi = ptg[i];
            //System.out.println(ptgi);
            Object objclass = ptg[i].getClass();
            //System.out.println(objclass);
            if (objclass == RefPtg.class){
                CellRangeAddress crad = CellRangeAddress.valueOf(ptgi.toFormulaString());

                int fr = crad.getFirstRow();
                int lr = crad.getLastRow();
                int fc = crad.getFirstColumn();
                int lc = crad.getLastColumn();

                crad.setFirstRow(fr + numberRowShift);
                crad.setLastRow(lr + numberRowShift);
                crad.setFirstColumn(fc + numberColShift);
                crad.setLastColumn(lc + numberColShift);

                ptgout[i] = new RefPtg(crad.formatAsString());

            } else if (objclass == AreaPtg.class) {
                CellRangeAddress crad = CellRangeAddress.valueOf(ptgi.toFormulaString());

                int fr = crad.getFirstRow();
                int lr = crad.getLastRow();
                int fc = crad.getFirstColumn();
                int lc = crad.getLastColumn();
                
                crad.setFirstRow(fr + numberRowShift);
                crad.setLastRow(lr + numberRowShift);
                crad.setFirstColumn(fc + numberColShift);
                crad.setLastColumn(lc + numberColShift);

                ptgout[i] = new AreaPtg(crad.formatAsString());
            } else {
                ptgout[i] = ptgi;
            }
        }

        return FormulaRenderer.toFormulaString(null, ptgout);
    }


	public void fitPrintRangeWidthAndHeight(String path, String extendType) throws IOException {
		/* FileInputStream fis = null; */
		FileOutputStream fos = null;
		try {
			Workbook workbook;
			workbook = getWorkbook(path);

			Sheet sheet = workbook.getSheetAt(0);
			// Iterate through each rows one by one
			
			sheet.setAutobreaks(true);

			if (extendType.equals("xls")) {
				PrintSetup ps = sheet.getPrintSetup();
				ps.setFitHeight((short) 1);
				ps.setFitWidth((short) 1);
			} else {
				XSSFPrintSetup ps1 = (XSSFPrintSetup) sheet.getPrintSetup(); 
				sheet.setFitToPage(true); 
				ps1.setFitWidth((short)1); 
				ps1.setFitHeight((short)0); 
			}

			fos = new FileOutputStream(new File(path));
			workbook.write(fos);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally {
			closeInputStream();
		}
		if (fos != null) {
			try {
				fos.flush();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * Index number for sheet by list level
	 * @param listLevel
	 * @param sheet
	 * @return 
	 * @author khoana
	 */
	public static void createIndex(Map<Integer, Integer> listLevel, Sheet sheet) {
		ArrayList<Integer> indexNumber = new ArrayList<Integer>();
		indexNumber.add(0);

		int levelCurrent = 0;
		Integer level = 0;
		if(listLevel != null && !listLevel.isEmpty()) {
			for (Map.Entry<Integer, Integer> entry : listLevel.entrySet()) {
				level = entry.getValue();
				if (level == levelCurrent) {
					int indexLevel = indexNumber.get(level) + 1;
					indexNumber.set(level, indexLevel);
				} else if (level > indexNumber.size() - 1) {
					indexNumber.add(1);
				} else {
					while (level < indexNumber.size() - 1) {
						indexNumber.remove(indexNumber.size() - 1);
					}

					int lastIndexOfNum = indexNumber.size() - 1;
					int indexLevel = indexNumber.get(lastIndexOfNum) + 1;
					indexNumber.set(lastIndexOfNum, indexLevel);
				}

				levelCurrent = level;
				
				Row rowCurrent = sheet.getRow(entry.getKey());
				Cell cellFirst = rowCurrent.getCell(0);
				
				String indexNumberStr = convertList2StringIndex(indexNumber).concat(cellFirst.getStringCellValue());
				cellFirst.setCellValue(indexNumberStr);
			}
		}
	}
	
	/**
	 * Convert list to index by type string
	 * @param indexNumber
	 * @return String
	 * @author khoana
	 */
	private static String convertList2StringIndex(ArrayList<Integer> indexNumber) {
		String indexStr = "";
		for (int i = 1; i < indexNumber.size(); i++) {
			int integer = indexNumber.get(i);
			indexStr = indexStr.concat(String.valueOf(integer)).concat(".");
		}

		return indexStr;
	}
}
