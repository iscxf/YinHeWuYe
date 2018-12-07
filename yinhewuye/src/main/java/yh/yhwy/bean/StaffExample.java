package yh.yhwy.bean;

import java.util.ArrayList;
import java.util.List;

public class StaffExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StaffExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andStafidIsNull() {
            addCriterion("stafid is null");
            return (Criteria) this;
        }

        public Criteria andStafidIsNotNull() {
            addCriterion("stafid is not null");
            return (Criteria) this;
        }

        public Criteria andStafidEqualTo(Integer value) {
            addCriterion("stafid =", value, "stafid");
            return (Criteria) this;
        }

        public Criteria andStafidNotEqualTo(Integer value) {
            addCriterion("stafid <>", value, "stafid");
            return (Criteria) this;
        }

        public Criteria andStafidGreaterThan(Integer value) {
            addCriterion("stafid >", value, "stafid");
            return (Criteria) this;
        }

        public Criteria andStafidGreaterThanOrEqualTo(Integer value) {
            addCriterion("stafid >=", value, "stafid");
            return (Criteria) this;
        }

        public Criteria andStafidLessThan(Integer value) {
            addCriterion("stafid <", value, "stafid");
            return (Criteria) this;
        }

        public Criteria andStafidLessThanOrEqualTo(Integer value) {
            addCriterion("stafid <=", value, "stafid");
            return (Criteria) this;
        }

        public Criteria andStafidIn(List<Integer> values) {
            addCriterion("stafid in", values, "stafid");
            return (Criteria) this;
        }

        public Criteria andStafidNotIn(List<Integer> values) {
            addCriterion("stafid not in", values, "stafid");
            return (Criteria) this;
        }

        public Criteria andStafidBetween(Integer value1, Integer value2) {
            addCriterion("stafid between", value1, value2, "stafid");
            return (Criteria) this;
        }

        public Criteria andStafidNotBetween(Integer value1, Integer value2) {
            addCriterion("stafid not between", value1, value2, "stafid");
            return (Criteria) this;
        }

        public Criteria andStafnameIsNull() {
            addCriterion("stafname is null");
            return (Criteria) this;
        }

        public Criteria andStafnameIsNotNull() {
            addCriterion("stafname is not null");
            return (Criteria) this;
        }

        public Criteria andStafnameEqualTo(String value) {
            addCriterion("stafname =", value, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafnameNotEqualTo(String value) {
            addCriterion("stafname <>", value, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafnameGreaterThan(String value) {
            addCriterion("stafname >", value, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafnameGreaterThanOrEqualTo(String value) {
            addCriterion("stafname >=", value, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafnameLessThan(String value) {
            addCriterion("stafname <", value, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafnameLessThanOrEqualTo(String value) {
            addCriterion("stafname <=", value, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafnameLike(String value) {
            addCriterion("stafname like", value, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafnameNotLike(String value) {
            addCriterion("stafname not like", value, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafnameIn(List<String> values) {
            addCriterion("stafname in", values, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafnameNotIn(List<String> values) {
            addCriterion("stafname not in", values, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafnameBetween(String value1, String value2) {
            addCriterion("stafname between", value1, value2, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafnameNotBetween(String value1, String value2) {
            addCriterion("stafname not between", value1, value2, "stafname");
            return (Criteria) this;
        }

        public Criteria andStafsexIsNull() {
            addCriterion("stafsex is null");
            return (Criteria) this;
        }

        public Criteria andStafsexIsNotNull() {
            addCriterion("stafsex is not null");
            return (Criteria) this;
        }

        public Criteria andStafsexEqualTo(String value) {
            addCriterion("stafsex =", value, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafsexNotEqualTo(String value) {
            addCriterion("stafsex <>", value, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafsexGreaterThan(String value) {
            addCriterion("stafsex >", value, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafsexGreaterThanOrEqualTo(String value) {
            addCriterion("stafsex >=", value, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafsexLessThan(String value) {
            addCriterion("stafsex <", value, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafsexLessThanOrEqualTo(String value) {
            addCriterion("stafsex <=", value, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafsexLike(String value) {
            addCriterion("stafsex like", value, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafsexNotLike(String value) {
            addCriterion("stafsex not like", value, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafsexIn(List<String> values) {
            addCriterion("stafsex in", values, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafsexNotIn(List<String> values) {
            addCriterion("stafsex not in", values, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafsexBetween(String value1, String value2) {
            addCriterion("stafsex between", value1, value2, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafsexNotBetween(String value1, String value2) {
            addCriterion("stafsex not between", value1, value2, "stafsex");
            return (Criteria) this;
        }

        public Criteria andStafageIsNull() {
            addCriterion("stafAge is null");
            return (Criteria) this;
        }

        public Criteria andStafageIsNotNull() {
            addCriterion("stafAge is not null");
            return (Criteria) this;
        }

        public Criteria andStafageEqualTo(Integer value) {
            addCriterion("stafAge =", value, "stafage");
            return (Criteria) this;
        }

        public Criteria andStafageNotEqualTo(Integer value) {
            addCriterion("stafAge <>", value, "stafage");
            return (Criteria) this;
        }

        public Criteria andStafageGreaterThan(Integer value) {
            addCriterion("stafAge >", value, "stafage");
            return (Criteria) this;
        }

        public Criteria andStafageGreaterThanOrEqualTo(Integer value) {
            addCriterion("stafAge >=", value, "stafage");
            return (Criteria) this;
        }

        public Criteria andStafageLessThan(Integer value) {
            addCriterion("stafAge <", value, "stafage");
            return (Criteria) this;
        }

        public Criteria andStafageLessThanOrEqualTo(Integer value) {
            addCriterion("stafAge <=", value, "stafage");
            return (Criteria) this;
        }

        public Criteria andStafageIn(List<Integer> values) {
            addCriterion("stafAge in", values, "stafage");
            return (Criteria) this;
        }

        public Criteria andStafageNotIn(List<Integer> values) {
            addCriterion("stafAge not in", values, "stafage");
            return (Criteria) this;
        }

        public Criteria andStafageBetween(Integer value1, Integer value2) {
            addCriterion("stafAge between", value1, value2, "stafage");
            return (Criteria) this;
        }

        public Criteria andStafageNotBetween(Integer value1, Integer value2) {
            addCriterion("stafAge not between", value1, value2, "stafage");
            return (Criteria) this;
        }

        public Criteria andPartIdIsNull() {
            addCriterion("part_id is null");
            return (Criteria) this;
        }

        public Criteria andPartIdIsNotNull() {
            addCriterion("part_id is not null");
            return (Criteria) this;
        }

        public Criteria andPartIdEqualTo(Integer value) {
            addCriterion("part_id =", value, "partId");
            return (Criteria) this;
        }

        public Criteria andPartIdNotEqualTo(Integer value) {
            addCriterion("part_id <>", value, "partId");
            return (Criteria) this;
        }

        public Criteria andPartIdGreaterThan(Integer value) {
            addCriterion("part_id >", value, "partId");
            return (Criteria) this;
        }

        public Criteria andPartIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("part_id >=", value, "partId");
            return (Criteria) this;
        }

        public Criteria andPartIdLessThan(Integer value) {
            addCriterion("part_id <", value, "partId");
            return (Criteria) this;
        }

        public Criteria andPartIdLessThanOrEqualTo(Integer value) {
            addCriterion("part_id <=", value, "partId");
            return (Criteria) this;
        }

        public Criteria andPartIdIn(List<Integer> values) {
            addCriterion("part_id in", values, "partId");
            return (Criteria) this;
        }

        public Criteria andPartIdNotIn(List<Integer> values) {
            addCriterion("part_id not in", values, "partId");
            return (Criteria) this;
        }

        public Criteria andPartIdBetween(Integer value1, Integer value2) {
            addCriterion("part_id between", value1, value2, "partId");
            return (Criteria) this;
        }

        public Criteria andPartIdNotBetween(Integer value1, Integer value2) {
            addCriterion("part_id not between", value1, value2, "partId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}