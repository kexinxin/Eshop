package org.csu.eshop.persistence;
import java.util.*;

import org.csu.eshop.domain.SaveItem;

/**
 * 
 */
public interface SaveItemMapper {

    /**
     * @param userName 
     * @return
     */
    public List<SaveItem> getSaveItemListByUserName(String userName);

    /**
     * @param saveItem 
     * @return
     */
    public void insertSaveItem(SaveItem saveItem);

    /**
     * @param saveItemId 
     * @return
     */
    public void delectSaveItemBySaveItemId(int saveItemId);
    public void delectSaveItemByUserName(String username);

}